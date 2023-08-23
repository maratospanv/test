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
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'sudo apt update && sudo apt-get install -y easy-rsa git prometheus-node-exporter && \
mkdir ~/easy-rsa && sudo ln -s /usr/share/easy-rsa/* ~/easy-rsa/ && \
sudo chown `whoami` ~/easy-rsa/* && chmod 700 ~/easy-rsa/*'

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
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'sudo apt update && sudo apt-get install -y easy-rsa openvpn git prometheus-node-exporter && \
cd ~ && git clone https://github.com/maratospanv/test.git && \
bash /home/`whoami`/test/2.Linux/final_work/vpn.sh'