#!/bin/bash
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf &> /dev/null && sudo sysctl -p &> /dev/null && \ 
sudo sed -i 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw &> /dev/null && \ 
sudo cp ~/test/2.Linux/final_work/before.rules /etc/ufw/before.rules && \
sudo ufw --force enable && sudo ufw allow 1194/udp && sudo ufw allow OpenSSH && \
mkdir -p ~/client-configs/{files,keys} && \
cp ~/test/2.Linux/final_work/base.conf ~/client-configs/base.conf && \
cp ~/test/2.Linux/final_work/make_config.sh ~/client-configs/ && chmod +x ~/client-configs/make_config.sh && \
sudo cp ~/certs/{ca.crt,ta.key} ~/client-configs/keys/ && \
myip=`dig @resolver4.opendns.com myip.opendns.com +short` && myport=1194 && \
sed -i "s/remote my-server-1 1194/remote $myip $myport/g" ~/client-configs/base.conf && sed -i "s/remote my-server-1 1194/remote $myip $myport/g" ~/client-configs/base.conf && \
oldifase=eth0 && \
iface=`ip a | grep '2: ' | awk '{print $2}' | sed 's/://g'` && \
sudo sed -i "s/$oldiface/$iface/g" /etc/ufw/before.rules && \
sudo cp ~/certs/{ca.crt,vpn.crt,ta.key,vpn.key} /etc/openvpn/server/ && sudo cp ~/test/2.Linux/final_work/server.conf /etc/openvpn/server/ && sudo chown root:root /etc/openvpn/server/{ca.crt,vpn.crt,ta.key,vpn.key,server.conf} && \
sudo systemctl -f enable openvpn-server@server.service && sudo systemctl restart openvpn-server@server.service