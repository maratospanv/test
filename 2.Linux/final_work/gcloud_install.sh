#!/bin/bash
#sudo apt-get update
#sudo apt-get install -y apt-transport-https ca-certificates gnupg curl sudo
#sudo echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
#curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
#sudo apt-get update && sudo apt-get install google-cloud-cli -y
##gcloud init --console-only --account=maratospanv@gmail.com  --project=avid-glass-396110

##gcloud auth login --no-browser
##-----Create PKI Infrastructure-----##
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
#gcloud compute instances list
#gcloud compute firewall-rules create allow-1194 --action=ALLOW --rules=udp:1194 --direction=INGRESS
#gcloud compute ssh `gcloud compute instances list | awk 'NR == 2{print $1}'` -- 'sudo apt update && sudo apt-get install -y easy-rsa && \
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'sudo apt update && sudo apt-get install -y easy-rsa && \
mkdir ~/easy-rsa && sudo ln -s /usr/share/easy-rsa/* ~/easy-rsa/ && \
sudo chown `whoami` ~/easy-rsa/* && chmod 700 ~/easy-rsa/* && \
cd ~/easy-rsa && \
cp vars.example vars && \
echo 'set_var EASYRSA_ALGO           ec' >> vars && \
echo 'set_var EASYRSA_DIGEST sha512' >> vars && \
./easyrsa init-pki
#echo -ne '\n' | ./easyrsa gen-req vpn nopass'


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
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'sudo apt update && sudo apt-get install -y easy-rsa openvpn git && \
cd ~ && git clone https://github.com/maratospanv/test.git && \
mkdir ~/easy-rsa && sudo ln -s /usr/share/easy-rsa/* ~/easy-rsa/ && \
sudo chown `whoami` ~/easy-rsa/* && chmod 700 ~/easy-rsa/* && \
cd ~/easy-rsa && \
cp vars.example vars && \
echo 'set_var EASYRSA_ALGO           ec' >> vars && \
echo 'set_var EASYRSA_DIGEST sha512' >> vars && \
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf && sudo sysctl -p && \ 
sudo sed -i 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw && \ 
sudo cp ~/test/2.Linux/final_work/before.rules /etc/ufw/before.rules && \
sudo ufw enable && sudo ufw allow 1194/udp && sudo ufw allow OpenSSH && echo "y" | sudo ufw disable && echo "y" | sudo ufw enable && \
mkdir -p ~/client-configs/{files,keys} && \
cp ~/test/2.Linux/final_work/base.conf ~/client-configs/base.conf && \
cp ~/test/2.Linux/final_work/make_config.sh ~/client-configs/ && \
sudo cp ~/test/2.Linux/final_work/{ca.crt,ta.key} ~/client-configs/keys/ && \
myip=`dig @resolver4.opendns.com myip.opendns.com +short` && myport=1194 && \s
sed -i "s/remote my-server-1 1194/remote $myip $myport/g" ~/client-configs/base.conf && sed -i "s/remote my-server-1 1194/remote $myip $myport/g" ~/client-configs/base.conf && \
sudo cp ~/test/2.Linux/final_work/{ca.crt,vpn.crt,server.conf,ta.key,vpn.key} /etc/openvpn/server/ && sudo chown root:root /etc/openvpn/server/{ca.crt,vpn.crt,server.conf,ta.key,vpn.key} && \
sudo systemctl -f enable openvpn-server@server.service && sudo systemctl start openvpn-server@server.service'