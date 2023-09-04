#!/bin/bash
confdir=~/vpnconf
if [ ! -d $confdir ]; then
  rm -rf $confdir
  mkdir $confdir
fi

if [ `gcloud compute firewall-rules list --format=json | grep allow-1194 | grep name > /dev/null && echo $?` == 0 ]; then
echo -e "\033[32m===Rule allow-1194 exixsts===\033[0m"
else
gcloud compute firewall-rules create allow-1194 --action=ALLOW --rules=udp:1194 --direction=INGRESS
fi

if [ `gcloud compute firewall-rules list --format=json | grep allow-9090 | grep name > /dev/null && echo $?` == 0 ]; then
echo -e "\033[32m===Rule allow-9090 exixsts===\033[0m"
else
gcloud compute firewall-rules create allow-9090 --action=ALLOW --rules=tcp:9090 --direction=INGRESS
fi
echo -e "\n" && \

echo -e "\033[32m=========Create PKI Server=========\033[0m" && \
gcloud config set project avid-glass-396110 && \
gcloud compute instances create pki-server \
    --project=avid-glass-396110 \
    --zone=us-east1-d \
    --machine-type=e2-micro \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=492882342467-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230727,mode=rw,size=10,type=projects/avid-glass-396110/zones/us-east1-d/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any && \
sleep 30
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'echo -e "\033[34m=========Update/Install packages=========\033[0m" && \
sudo apt -qq update 1>/dev/null && sudo apt-get -y install easy-rsa git prometheus-node-exporter expect-dev expect > apt.txt && \
sudo timedatectl set-timezone "Asia/Almaty" && \
echo && \
echo -e "\033[34m=========Configure CA Server=========\033[0m" && \
mkdir ~/easy-rsa && sudo ln -s /usr/share/easy-rsa/* ~/easy-rsa/ && \
sudo chown `whoami` ~/easy-rsa/* && chmod 700 ~/easy-rsa/* && \
cd ~/easy-rsa && \
cp vars.example vars && \
echo 'set_var EASYRSA_BATCH          "yes"' >> vars && \
echo 'set_var EASYRSA_ALGO           ec' >> vars && \
echo 'set_var EASYRSA_DIGEST sha512' >> vars && \
cd /home/`whoami`/easy-rsa/ && \
./easyrsa init-pki 1>/dev/null && \
cd /home/`whoami`/easy-rsa/ && \
capass=`date +%s | sha256sum | base64 | head -c 32 ; echo` && \
echo $capass > ca.txt && \
echo && \
echo -e "\033[34m=========Build CA Certificate=========\033[0m" && \
echo -e "$capass\n$capass\n" | ./easyrsa build-ca 1>/dev/null && \
echo -e "\033[34m=========Configure Backup=========\033[0m" && \
sudo mkdir /backup && sudo chmod -R 644 /backup && \
sudo touch /etc/systemd/system/backup.service && \
sudo touch /etc/systemd/system/backup.timer && \
sudo chmod 777 /etc/systemd/system/backup.service && \
sudo chmod 777 /etc/systemd/system/backup.timer && \
sudo ln -s ~/easy-rsa/pki /usr/share/easy-rsa/pkis && \
sudo cat << EOF >> /etc/systemd/system/backup.service
[Unit]
Description=Backup service

[Service]
Type=oneshot
PIDFile=/run/backup.pid
ExecStart=tar -czf /backup/vpnserver-bkp-\$(date +%d-%m-%Y-%H-%M).tar.gz /usr/share/easy-rsa/pkis /etc/openvpn/server/ && find /backup -name "vpnserver-bkp*" -mtime +13 -exec rm -f {} \;

[Install]
WantedBy=multi-user.target
EOF

sudo cat << EOF >> /etc/systemd/system/backup.timer
[Unit]
Description=Backup timer

[Timer]
OnCalendar=Mon..Sun *-*-* 00:00:*
Unit=backup.service
EOF
sudo chmod 644 /etc/systemd/system/backup.service && \
sudo chmod 644 /etc/systemd/system/backup.timer && \
sudo systemctl daemon-reload && \
sudo systemctl enable backup.timer' && \
rm -f $confdir/* && \
gcloud compute scp pki-server:~/easy-rsa/ca.txt $confdir 1>/dev/null && \

echo -e "\n" && \
echo -e "\033[32m=========Create VPN Server=========\033[0m" && \
echo && \
gcloud config set project avid-glass-396110 && \
gcloud compute instances create vpn-server \
    --project=avid-glass-396110 \
    --zone=us-east1-d \
    --machine-type=e2-micro \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=492882342467-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230727,mode=rw,size=10,type=projects/avid-glass-396110/zones/us-east1-d/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any && \
sleep 30
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'echo -e "\033[34m=========Update/Install packages=========\033[0m" && \
sudo apt -qq update 1>/dev/null && sudo apt-get -y install easy-rsa openvpn git prometheus-node-exporter expect-dev expect > apt.txt && \
sudo timedatectl set-timezone "Asia/Almaty" && \
echo && \
echo -e "\033[34m=========Create VPN Server Certs=========\033[0m" && \
mkdir ~/easy-rsa && sudo ln -s /usr/share/easy-rsa/* ~/easy-rsa/ && \
sudo chown `whoami` ~/easy-rsa/* && chmod 700 ~/easy-rsa/* && \
cd ~/easy-rsa && \
cp vars.example vars && \
echo 'set_var EASYRSA_ALGO           ec' >> vars && \
echo 'set_var EASYRSA_DIGEST sha512' >> vars && \
cd /home/`whoami`/easy-rsa/ && \
./easyrsa init-pki 1>/dev/null && \
cd /home/`whoami`/easy-rsa/ && \
echo -ne "\n" | ./easyrsa gen-req vpn nopass 1>/dev/null && \
openvpn --genkey --secret ta.key 1>/dev/null && \
cd ~ && git clone -q https://github.com/maratospanv/test.git'
gcloud compute scp $confdir/ca.txt vpn-server:~/easy-rsa/ && \
gcloud compute scp vpn-server:~/easy-rsa/pki/reqs/vpn.req $confdir && \
gcloud compute scp $confdir/vpn.req pki-server:~/easy-rsa/ && \
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'cd /home/`whoami`/easy-rsa/ && \
./easyrsa import-req /home/`whoami`/easy-rsa/vpn.req server && \
cp /home/`whoami`/easy-rsa/vpn.req /home/`whoami`/easy-rsa/pki/reqs && \
cd /home/`whoami`/easy-rsa/ && \
capassvpn=`cat ~/easy-rsa/ca.txt` && \
/usr/bin/expect<<EOF
    spawn /home/marat/easy-rsa/easyrsa sign-req server vpn
    expect "Confirm*"
    send "yes\n"
    expect "Enter*"
    send "$capassvpn\n"
    expect eof
EOF
echo -e "\033[34m=========Configure Backup=========\033[0m" && \
sudo mkdir /backup && sudo chmod -R 644 /backup && \
sudo touch /etc/systemd/system/backup.service && \
sudo touch /etc/systemd/system/backup.timer && \
sudo chmod 777 /etc/systemd/system/backup.service && \
sudo chmod 777 /etc/systemd/system/backup.timer && \
sudo ln -s ~/easy-rsa/pki /usr/share/easy-rsa/pkis && \
sudo cat << EOF >> /etc/systemd/system/backup.service
[Unit]
Description=Backup service

[Service]
Type=oneshot
PIDFile=/run/backup.pid
ExecStart=tar -czf /backup/vpnserver-bkp-\$(date +%d-%m-%Y-%H-%M).tar.gz /usr/share/easy-rsa/pkis /etc/openvpn/server/ && find /backup -name "vpnserver-bkp*" -mtime +13 -exec rm -f {} \;

[Install]
WantedBy=multi-user.target
EOF

sudo cat << EOF >> /etc/systemd/system/backup.timer
[Unit]
Description=Backup timer

[Timer]
OnCalendar=Mon..Sun *-*-* 00:00:*
Unit=backup.service
EOF
sudo chmod 644 /etc/systemd/system/backup.service && \
sudo chmod 644 /etc/systemd/system/backup.timer && \
sudo systemctl daemon-reload && \
sudo systemctl enable backup.timer' && \
gcloud compute scp pki-server:~/easy-rsa/pki/issued/vpn.crt $confdir && \
gcloud compute scp pki-server:~/easy-rsa/pki/ca.crt $confdir && \
gcloud compute scp vpn-server:~/easy-rsa/pki/private/vpn.key $confdir && \
gcloud compute scp vpn-server:~/easy-rsa/ta.key $confdir && \
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'cd ~ && mkdir certs' > /dev/null && \
gcloud compute scp $confdir/{ca.crt,vpn.crt,vpn.key,ta.key} vpn-server:~/certs && \
echo -e "\033[34m=========Configure VPN Server=========\033[0m" && \
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'bash /home/`whoami`/test/2.Linux/final_work/vpn.sh' && \
sleep 5
gcloud compute instances reset vpn-server && \

echo -e "\n" && \
echo -e "\033[32m=========Create Monitoring Server=========\033[0m" && \
echo && \
gcloud config set project avid-glass-396110 && \
gcloud compute instances create mon-server \
    --project=avid-glass-396110 \
    --zone=us-east1-d \
    --machine-type=e2-micro \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=492882342467-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230727,mode=rw,size=10,type=projects/avid-glass-396110/zones/us-east1-d/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any && \
sleep 30
gcloud compute ssh `gcloud compute instances list | grep mon-server | awk '{print $1}'` -- 'echo -e "\033[34m=========Update/Install packages=========\033[0m" && \
sudo apt -qq update 1>/dev/null && sudo apt-get -qq -y install git prometheus prometheus-alertmanager > apt.txt && \
sudo timedatectl set-timezone "Asia/Almaty" && \
cd ~ && git clone -q https://github.com/maratospanv/test.git && \
if [ ! -e "/etc/prometheus/alert.rules.yml" ]; then
    sudo touch /etc/prometheus/alert.rules.yml
fi
sudo sed -i 's/ARGS=""/ARGS="--collector.systemd"/' /etc/default/prometheus-node-exporter && \
sudo chmod 777 /etc/prometheus/alertmanager.yml && \
sudo cat << EOF >> /etc/prometheus/alertmanager.yml

- name: 'mail-ru'
  email_configs:
  - to: 'ospanov_m86@mail.ru'
    from: 'ospanov_m86@mail.ru'
    smarthost: smtp.mail.ru:587
    auth_username: "ospanov_m86@mail.ru"
    auth_identity: "ospanov_m86@mail.ru"
    auth_password: "aFSDTMEwjiezqMAAyQNg"
    send_resolved: true
EOF
sudo sed -i 's/receiver: team-X-mails/receiver: mail-ru/' /etc/prometheus/alertmanager.yml && \
sudo chmod 777 /etc/prometheus/prometheus.yml && sudo chmod 777 /etc/prometheus/alert.rules.yml && \
sudo cat << EOF >> /etc/prometheus/prometheus.yml
  - job_name: mon-server
    static_configs:
      - targets: ['mon-server:9100']

  - job_name: pki-server
    static_configs:
      - targets: ['pki-server:9100']

  - job_name: vpn-server
    static_configs:
      - targets: ['vpn-server:9100']
EOF
sudo cat << EOF >> /etc/prometheus/alert.rules.yml
groups:
    - name: _alerts
      rules:
      - alert: HighCPUtilization
        expr: rate(node_cpu_seconds_total{mode="system"}[2m]) > 0.2
        for: 2m
        labels:
          severity: critical
        annotations:
          summary: High CPU utilization on host {{ $labels.instance }}
          description: The CPU utilization on host {{ $labels.instance }}.

      - alert: HighMemoryUtilization
        expr: node_memory_MemTotal_bytes - node_memory_MemFree_bytes - (node_memory_Buffers_bytes + node_memory_Cached_bytes) == node_memory_MemTotal_bytes - (node_memory_MemTotal_bytes/100*85)
        for: 2m
        labels:
          severity: critical
        annotations:
          summary: High Memory utilization on host {{ $labels.instance }}
          description: The Memory utilization on host {{ $labels.instance }} has exceeded 85% for 2 minutes.

      - alert: HighDiskUtilization
        expr: ((node_filesystem_size_bytes{mountpoint="/"}) - (node_filesystem_free_bytes{mountpoint="/"} ))  / ((node_filesystem_size_bytes{mountpoint="/"}) / 100 ) > 85
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: High Disk utilization on host {{ $labels.instance }}
          description: The Disk utilization on host {{ $labels.instance }} has exceeded 85% for 5 minutes.
      
      - alert: OpenVPN Server state
        expr: node_systemd_unit_state{instance="vpn-server:9100",job="vpn-server",name="openvpn-server@server.service",state="active"} != 1
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: OpenVPN Server state down {{ $labels.instance }}
          description: TOpenVPN Server state down {{ $labels.instance }} for 5 minutes.
EOF
sudo chmod 644 /etc/prometheus/prometheus.yml && sudo chmod 644 /etc/prometheus/alert.rules.yml && sudo chmod 644 /etc/prometheus/alertmanager.yml' && \
gcloud compute ssh `gcloud compute instances list | grep mon-server | awk '{print $1}'` -- "sudo sed -i '/'rule_files:'/a\  - "alert.rules.yml"' /etc/prometheus/prometheus.yml && sudo systemctl restart prometheus prometheus-alertmanager" && \
gcloud compute instances list | grep -e pki-server -e vpn-server -e mon-server | awk {'print $4,$1'} > ~/gcinstance.txt  && \
gcloud compute scp ~/gcinstance.txt pki-server:~/ > /dev/null && \
gcloud compute scp ~/gcinstance.txt vpn-server:~/ > /dev/null && \
gcloud compute scp ~/gcinstance.txt mon-server:~/ > /dev/null && \
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'sudo chmod 666 /etc/hosts && sudo cat ~/gcinstance.txt >> /etc/hosts && sudo chmod 644 /etc/hosts' > /dev/null && \
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'sudo chmod 666 /etc/hosts && sudo cat ~/gcinstance.txt >> /etc/hosts && sudo chmod 644 /etc/hosts' > /dev/null && \
gcloud compute ssh `gcloud compute instances list | grep mon-server | awk '{print $1}'` -- 'sudo chmod 666 /etc/hosts && sudo cat ~/gcinstance.txt >> /etc/hosts && sudo chmod 644 /etc/hosts' > /dev/null && \
gcloud compute instances list