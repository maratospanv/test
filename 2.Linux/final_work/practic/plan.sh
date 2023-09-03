#!/bin/bash
confdir=~/vpnconf
BLUE='\033[0;34m'
WHITE='\033[0;37m' 
RED='\033[0;31m'
GREEN='\033[0;32m'
if [ ! -d $confdir ]; then
  rm -rf $confdir
  mkdir $confdir
fi && \

if [ `gcloud compute firewall-rules list --format=json | grep allow-1194 | grep name > /dev/null && echo $?` == 0 ]; then
echo "===Rule allow-1194 exixsts==="
else
gcloud compute firewall-rules create allow-1194 --action=ALLOW --rules=udp:1194 --direction=INGRESS
fi && \

if [ `gcloud compute firewall-rules list --format=json | grep allow-9090 | grep name > /dev/null && echo $?` == 0 ]; then
echo "===Rule allow-9090 exixsts==="
else
gcloud compute firewall-rules create allow-9090 --action=ALLOW --rules=tcp:9090 --direction=INGRESS
fi && \
echo -e "\n" && \

echo -e "\033[32m=========Create PKI Server=========\033[0m" && \
echo && \
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
    --reservation-affinity=any 1> /dev/null && \
sleep 30
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'echo -e "\033[34m=========Update/Install packages=========\033[0m" && \
sudo apt -qq update 1>/dev/null && sudo apt-get -qq -y install easy-rsa git prometheus-node-exporter expect-dev expect > apt.txt && \
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
mkdir ~/backup && echo "*/10 * * * 1 sudo tar -czf ~/backup/pkiserver-$(date +%Y-%m-%d-%M-%H).tar.gz ~/easy-rsa/pki" | crontab -' && \
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
    --reservation-affinity=any 1> /dev/null && \
sleep 30
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'echo -e "\033[34m=========Update/Install packages=========\033[0m" && \
sudo apt -qq update 1>/dev/null && sudo apt-get -qq -y install easy-rsa openvpn git prometheus-node-exporter expect-dev expect > apt.txt && \
echo && \
echo -e "\033[34m=========Create VPN Server Certs=========\033[0m"
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
gcloud compute scp $confdir/ca.txt vpn-server:~/easy-rsa/ 1>/dev/null && \
gcloud compute scp vpn-server:~/easy-rsa/pki/reqs/vpn.req $confdir 1>/dev/null && \
gcloud compute scp $confdir/vpn.req pki-server:~/easy-rsa/ 1>/dev/null && \
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
EOF'
gcloud compute scp pki-server:~/easy-rsa/pki/issued/vpn.crt $confdir 1>/dev/null && \
gcloud compute scp pki-server:~/easy-rsa/pki/ca.crt $confdir 1>/dev/null && \
gcloud compute scp vpn-server:~/easy-rsa/pki/private/vpn.key $confdir 1>/dev/null && \
gcloud compute scp vpn-server:~/easy-rsa/ta.key $confdir 1>/dev/null && \
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'cd ~ && mkdir certs' > /dev/null && \
gcloud compute scp $confdir/{ca.crt,vpn.crt,vpn.key,ta.key} vpn-server:~/certs 1>/dev/null && \
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'echo -e "\033[34m=========Configure VPN Server=========\033[0m && \
bash /home/`whoami`/test/2.Linux/final_work/vpn.sh > /dev/null && \
mkdir ~/backup && echo "*/10 * * * 1 sudo tar -czf ~/backup/vpnserver-$(date +%Y-%m-%d-%M-%H).tar.gz ~/easy-rsa/pki ~/client-configs ~/certs /etc/openvpn/server" | crontab -' && \
#gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'sudo reboot'
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
    --reservation-affinity=any 1> /dev/null && \
sleep 30
gcloud compute ssh `gcloud compute instances list | grep mon-server | awk '{print $1}'` -- 'echo -e "\033[34m=========Update/Install packages=========\033[0m" && \
sudo apt -qq update 1>/dev/null && sudo apt-get -qq -y install git prometheus prometheus-alertmanager > apt.txt && \
cd ~ && git clone -q https://github.com/maratospanv/test.git && \
if [ ! -e "/etc/prometheus/alert.rules.yml" ]; then
    sudo touch /etc/prometheus/alert.rules.yml
fi 
sudo chmod 777 /etc/prometheus/prometheus.yml && sudo chmod 777 /etc/prometheus/alert.rules.yml && \
sudo cat << EOF >> /etc/prometheus/prometheus.yml
  - job_name: mon-server
    static_configs:
      - targets: ['mon-server:9100']

  - job_name: pki-server
    static_configs:
      - targets: ['pki-server:9100']

  - job_name: vpn-serer
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
EOF
sudo chmod 644 /etc/prometheus/prometheus.yml && sudo chmod 644 /etc/prometheus/alert.rules.yml' && \
gcloud compute ssh `gcloud compute instances list | grep mon-server | awk '{print $1}'` -- "sudo sed -i '/'rule_files:'/a\  - "alert.rules.yml"' /etc/prometheus/prometheus.yml && sudo systemctl restart prometheus prometheus-alertmanager" && \
gcloud compute instances list | grep -e pki-server -e vpn-server -e mon-server | awk {'print $4,$1'} > ~/gcinstance.txt  && \
gcloud compute scp ~/gcinstance.txt pki-server:~/ > /dev/null && \
gcloud compute scp ~/gcinstance.txt vpn-server:~/ > /dev/null && \
gcloud compute scp ~/gcinstance.txt mon-server:~/ > /dev/null && \
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'sudo chmod 666 /etc/hosts && sudo cat ~/gcinstance.txt >> /etc/hosts && sudo chmod 644 /etc/hosts' > /dev/null && \
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'sudo chmod 666 /etc/hosts && sudo cat ~/gcinstance.txt >> /etc/hosts && sudo chmod 644 /etc/hosts' > /dev/null && \
gcloud compute ssh `gcloud compute instances list | grep mon-server | awk '{print $1}'` -- 'sudo chmod 666 /etc/hosts && sudo cat ~/gcinstance.txt >> /etc/hosts && sudo chmod 644 /etc/hosts' > /dev/null && \
gcloud compute instances list