#!/bin/bash
#sudo apt update && sudo apt-get install -y easy-rsa openvpn git && \
#cd ~ && git clone https://github.com/maratospanv/test.git && \
mkdir ~/easy-rsa && sudo ln -s /usr/share/easy-rsa/* ~/easy-rsa/ && \
sudo chown `whoami` ~/easy-rsa/* && chmod 700 ~/easy-rsa/* && \
cd ~/easy-rsa && \
cp vars.example vars && \
echo 'set_var EASYRSA_ALGO           ec' >> vars && \
echo 'set_var EASYRSA_DIGEST sha512' >> vars && \
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf && sudo sysctl -p && \ 
sudo sed -i 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw && \ 
sudo cp ~/test/2.Linux/final_work/before.rules /etc/ufw/before.rules && \
sudo ufw --force enable && sudo ufw allow 1194/udp && sudo ufw allow OpenSSH && \
mkdir -p ~/client-configs/{files,keys} && \
cp ~/test/2.Linux/final_work/base.conf ~/client-configs/base.conf && \
cp ~/test/2.Linux/final_work/make_config.sh ~/client-configs/ && chmod +x ~/client-configs/make_config.sh && \
sudo cp ~/test/2.Linux/final_work/{ca.crt,ta.key} ~/client-configs/keys/ && \
myip=`dig @resolver4.opendns.com myip.opendns.com +short` && myport=1194 && \
sed -i "s/remote my-server-1 1194/remote $myip $myport/g" ~/client-configs/base.conf && sed -i "s/remote my-server-1 1194/remote $myip $myport/g" ~/client-configs/base.conf && \
sudo cp ~/test/2.Linux/final_work/{ca.crt,vpn.crt,server.conf,ta.key,vpn.key} /etc/openvpn/server/ && sudo chown root:root /etc/openvpn/server/{ca.crt,vpn.crt,server.conf,ta.key,vpn.key} && \
sudo systemctl -f enable openvpn-server@server.service && sudo systemctl start openvpn-server@server.service