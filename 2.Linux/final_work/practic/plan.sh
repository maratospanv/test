#!/bin/bash
#1. создать чистый pki сервер
gcloud config set project avid-glass-396110
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
    --reservation-affinity=any
sleep 30
if [ ! -d "~/vpnconf" ]; then
  rm -rf ~/vpnconf
  mkdir ~/vpnconf
fi
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'sudo apt -qq update && sudo apt-get install -y easy-rsa git prometheus-node-exporter expect-dev expect && \
mkdir ~/easy-rsa && sudo ln -s /usr/share/easy-rsa/* ~/easy-rsa/ && \
sudo chown `whoami` ~/easy-rsa/* && chmod 700 ~/easy-rsa/* && \
cd ~/easy-rsa && \
cp vars.example vars && \
echo 'set_var EASYRSA_BATCH          "yes"' >> vars && \
echo 'set_var EASYRSA_ALGO           ec' >> vars && \
echo 'set_var EASYRSA_DIGEST sha512' >> vars && \
cd /home/`whoami`/easy-rsa/ && \
./easyrsa init-pki && \
cd /home/`whoami`/easy-rsa/ && \
capass=`date +%s | sha256sum | base64 | head -c 32 ; echo` && \
echo $capass > ca.txt && \
echo -e "$capass\n$capass\n" | ./easyrsa build-ca' && \
rm -f ~/vpnconf/* && \
gcloud compute scp pki-server:~/easy-rsa/ca.txt ~/vpnconf
#sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g'  && \
#sudo systemctl restart sshd.service
#sudo useradd vpn && echo -ne "p@$$w0rD\np@$$w0rD\n" | sudo passwd vpn && sudo usermod -aG sudo vpn && sudo usermod -aG google-sudoers vpn'

#2. создать чистый vpn сервер
gcloud config set project avid-glass-396110
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
    --reservation-affinity=any
sleep 30
gcloud compute firewall-rules create allow-1194 --action=ALLOW --rules=udp:1194 --direction=INGRESS
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'sudo apt -qq update && sudo apt-get install -y easy-rsa openvpn git prometheus-node-exporter expect-dev expect && \
#sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g'  && \
#sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config  && \
#sudo systemctl restart sshd.service && \
mkdir ~/easy-rsa && sudo ln -s /usr/share/easy-rsa/* ~/easy-rsa/ && \
sudo chown `whoami` ~/easy-rsa/* && chmod 700 ~/easy-rsa/* && \
cd ~/easy-rsa && \
cp vars.example vars && \
echo 'set_var EASYRSA_ALGO           ec' >> vars && \
echo 'set_var EASYRSA_DIGEST sha512' >> vars && \
cd /home/`whoami`/easy-rsa/ && \
./easyrsa init-pki && \
cd /home/`whoami`/easy-rsa/ && \
echo -ne "\n" | ./easyrsa gen-req vpn nopass && \
openvpn --genkey --secret ta.key && \
cd ~ && git clone https://github.com/maratospanv/test.git'
gcloud compute scp ~/vpnconf/ca.txt vpn-server:~/easy-rsa/ && \
gcloud compute scp vpn-server:~/easy-rsa/pki/reqs/vpn.req ~/vpnconf && \
gcloud compute scp ~/vpnconf/vpn.req pki-server:~/easy-rsa/
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
gcloud compute scp pki-server:~/easy-rsa/pki/issued/vpn.crt ~/vpnconf && \
gcloud compute scp pki-server:~/easy-rsa/pki/ca.crt ~/vpnconf && \
gcloud compute scp vpn-server:~/easy-rsa/pki/private/vpn.key ~/vpnconf && \
gcloud compute scp vpn-server:~/easy-rsa/ta.key ~/vpnconf && \
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'cd ~ && mkdir certs' && \
gcloud compute scp ~/vpnconf/{ca.crt,vpn.crt,vpn.key,ta.key} vpn-server:~/certs && \
#gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'cd ~ certs && sudo cp * /etc/openvpn/server/' && \
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'bash /home/`whoami`/test/2.Linux/final_work/vpn.sh'

#3. создать чистый mon сервер
gcloud config set project avid-glass-396110
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
    --reservation-affinity=any
sleep 30
gcloud compute ssh `gcloud compute instances list | grep mon-server | awk '{print $1}'` -- 'sudo apt update'
gcloud compute ssh `gcloud compute instances list | grep mon-server | awk '{print $1}'` -- 'sudo apt-get install -y git prometheus prometheus-alertmanager
cd ~ && git clone https://github.com/maratospanv/test.git && \
sudo chmod 777 /etc/prometheus/prometheus.yml && \
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
sudo chmod 644 /etc/prometheus/prometheus.yml && \
sudo systemctl restart prometheus prometheus-alertmanager' && \
gcloud compute instances list | grep -e pki-server -e vpn-server -e mon-server | awk {'print $4,$1'} > ~/gcinstance.txt  && \
gcloud compute scp ~/gcinstance.txt pki-server:~/ && \
gcloud compute scp ~/gcinstance.txt vpn-server:~/ && \
gcloud compute scp ~/gcinstance.txt mon-server:~/ && \
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'sudo chmod 666 /etc/hosts && sudo cat ~/gcinstance.txt >> /etc/hosts && sudo chmod 644 /etc/hosts' && \
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'sudo chmod 666 /etc/hosts && sudo cat ~/gcinstance.txt >> /etc/hosts && sudo chmod 644 /etc/hosts' && \
gcloud compute ssh `gcloud compute instances list | grep mon-server | awk '{print $1}'` -- 'sudo chmod 666 /etc/hosts && sudo cat ~/gcinstance.txt >> /etc/hosts && sudo chmod 644 /etc/hosts'