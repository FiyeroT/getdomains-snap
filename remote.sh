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
echo "        option server_addr 'isolde.fiyero.xyz'" >> /etc/config/frpc
echo "        option server_port '8443'" >> /etc/config/frpc
echo "        option tls_enable 'true'" >> /etc/config/frpc
echo "        option log_level 'trace'" >> /etc/config/frpc
echo "        option login_fail_exit 'false'" >> /etc/config/frpc
echo "        option token 'b2140d9d-98fd-4e50-8af1-286147bcf441'" >> /etc/config/frpc
echo "" >> /etc/config/frpc
echo "config conf 'sshAlex'" >> /etc/config/frpc
echo "        option type 'tcp'" >> /etc/config/frpc
echo "        option local_ip '192.168.7.1'" >> /etc/config/frpc
echo "        option local_port '22'" >> /etc/config/frpc
echo "        option remote_port '17022'" >> /etc/config/frpc
echo "        option name 'sshAlex'" >> /etc/config/frpc
echo "" >> /etc/config/frpc
echo "config conf 'webAlex'" >> /etc/config/frpc
echo "        option type 'tcp'" >> /etc/config/frpc
echo "        option local_ip '192.168.7.1'" >> /etc/config/frpc
echo "        option local_port '80'" >> /etc/config/frpc
echo "        option remote_port '17080'" >> /etc/config/frpc
echo "        option name 'webAlex'" >> /etc/config/frpc

printf "\033[32;1mFRPC start\033[0m\n"
service frpc enable && service frpc restart

printf "\033[32;1mRemote control ready\033[0m\n"
