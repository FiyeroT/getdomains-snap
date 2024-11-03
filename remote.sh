#!/bin/sh

set -e

printf "\033[32;1mInstalling frpc\033[0m\n"
opkg update && opkg install frpc

printf "\033[32;1mConfiguring frpc\033[0m\n"
echo "" > /etc/config/frpc
echo "config init" >> /etc/config/frpc
echo "        option stdout '1'" >> /etc/config/frpc
echo "        option stderr '1'" >> /etc/config/frpc
echo "        option user 'root'" >> /etc/config/frpc
echo "        option group 'root'" >> /etc/config/frpc
echo "        option respawn '1'" >> /etc/config/frpc
echo "" >> /etc/config/frpc
echo "config conf 'common'" >> /etc/config/frpc
echo "        option server_addr 'beta.fiyero.xyz'" >> /etc/config/frpc
echo "        option server_port '63337'" >> /etc/config/frpc
echo "        option tls_enable 'true'" >> /etc/config/frpc
echo "        option log_level 'trace'" >> /etc/config/frpc
echo "        option token '4a34e841-5c11-4213-8510-79cf10a0dbab'" >> /etc/config/frpc
echo "" >> /etc/config/frpc
echo "config conf 'sshAlek'" >> /etc/config/frpc
echo "        option type 'tcp'" >> /etc/config/frpc
echo "        option local_ip '192.168.0.11'" >> /etc/config/frpc
echo "        option local_port '22'" >> /etc/config/frpc
echo "        option remote_port '17022'" >> /etc/config/frpc
echo "        option name 'sshAlek'" >> /etc/config/frpc
echo "" >> /etc/config/frpc
echo "config conf 'webAlek'" >> /etc/config/frpc
echo "        option type 'tcp'" >> /etc/config/frpc
echo "        option local_ip '192.168.0.11'" >> /etc/config/frpc
echo "        option local_port '80'" >> /etc/config/frpc
echo "        option remote_port '17080'" >> /etc/config/frpc
echo "        option name 'webAlek'" >> /etc/config/frpc

printf "\033[32;1mFRPC start\033[0m\n"
service frpc enable && service frpc restart

printf "\033[32;1mRemote control ready\033[0m\n"

