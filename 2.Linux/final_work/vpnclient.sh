#!/bin/bash
client=tempclient.sh
rm -f $client > /dev/null
touch $client
echo '#!/bin/bash
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '\''{print $1}'\''` -- '\''cd ~/easy-rsa && \
echo -ne "yes\n" | ./easyrsa gen-req client1 nopass'\''
gcloud compute scp vpn-server:~/easy-rsa/pki/reqs/client1.req ~/vpnconf/
gcloud compute scp ~/vpnconf/client1.req  pki-server:~/
gcloud compute ssh `gcloud compute instances list | grep pki-server | awk '\''{print $1}'\''` -- '\''cd /home/`whoami`/easy-rsa/ && \
./easyrsa import-req ~/client1.req client1 && \
cd /home/`whoami`/easy-rsa/ && \
capassvpn=`cat ~/easy-rsa/ca.txt` && \
/usr/bin/expect<<EOF
    spawn /home/`whoami`/easy-rsa/easyrsa sign-req client client1
    expect "Confirm*"
    send "yes\n"
    expect "Enter*"
    send "$capassvpn\n"
    expect eof
EOF'\''
gcloud compute scp pki-server:~/easy-rsa/pki/issued/client1.crt ~/vpnconf/
gcloud compute scp ~/vpnconf/client1.crt vpn-server:~/client-configs/keys/
gcloud compute ssh `gcloud compute instances list | grep vpn-server | awk '\''{print $1}'\''` -- '\''cd ~/client-configs/keys/ && \
sudo chmod 744 * && \
cp ~/easy-rsa/pki/private/client1.key ~/client-configs/keys/ && \
cd ~/client-configs/ && ./make_config.sh client1'\''
gcloud compute scp vpn-server:~/client-configs/files/client1.ovpn ~/vpnconf' > $client
sed -i "s/client1/$1/g" $client
bash $client && \
rm -f $client