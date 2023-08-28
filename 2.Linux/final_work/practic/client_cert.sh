#!/bin/bash
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'cd ~/easy-rsa && \
echo -ne "yes\n" | ./easyrsa gen-req client6 nopass'
#req: /home/marat/easy-rsa/pki/reqs/client6.req
#key: /home/marat/easy-rsa/pki/private/client6.key
gcloud compute scp vpn-server:~/easy-rsa/pki/reqs/client6.req ~/vpnconf/
gcloud compute scp ~/vpnconf/client6.req  pki-server:~/
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '{print $1}'` -- 'cd /home/`whoami`/easy-rsa/ && \
./easyrsa import-req ~/client6.req client6 && \
cd /home/`whoami`/easy-rsa/ && \
#./easyrsa sign-req client client6
capassvpn=`cat ~/easy-rsa/ca.txt` && \
/usr/bin/expect<<EOF
    spawn /home/`whoami`/easy-rsa/easyrsa sign-req client client6
    expect "Confirm*"
    send "yes\n"
    expect "Enter*"
    send "$capassvpn\n"
    expect eof
EOF'
gcloud compute scp pki-server:~/easy-rsa/pki/issued/client6.crt ~/vpnconf/
gcloud compute scp ~/vpnconf/client6.crt vpn-server:~/client-configs/keys/
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '{print $1}'` -- 'cd ~/client-configs/keys/ && \
sudo chmod 744 * && \
cp ~/easy-rsa/pki/private/client6.key ~/client-configs/keys/ && \
cd ~/client-configs/ && ./make_config.sh client6'
gcloud compute scp vpn-server:~/client-configs/files/client6.ovpn ~/vpnconf