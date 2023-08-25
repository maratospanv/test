#!/bin/bash
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'cd ~/easy-rsa && \\
./easyrsa gen-req client3 nopass'
#req: /home/marat/easy-rsa/pki/reqs/client3.req
#key: /home/marat/easy-rsa/pki/private/client3.key
gcloud compute scp vpn-server:~/easy-rsa/pki/reqs/client3.req ~/client-reqs/
gcloud compute scp ~/client-reqs/client3.req  pki-server:~/
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'cd /home/`whoami`/easy-rsa/ && \
./easyrsa import-req ~/client3.req client3 && \
cd /home/`whoami`/easy-rsa/ && \
./easyrsa sign-req client client3'
gcloud compute scp pki-server:~/easy-rsa/pki/issued/client3.crt ~/client-reqs/
gcloud compute scp ~/client-reqs/client3.crt vpn-server:~/client-configs/keys/
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'cd ~/client-configs/keys/ && \
sudo chmod 744 * && \
cd ~/client-configs/ && ./make_config.sh client3'
gcloud compute scp vpn-server:~/client-configs/client3.ovpn ~/client-reqs