#!/bin/bash
GREEN='\033[0;32m'
BLUE='\033[0;34'
NC='\033[0M'

echo -e "${BLUE}Netdata kuruluyor ${NC}"

curl https://get.netdata.cloud/kickstart.sh > kickstart.sh
chmod +x kickstart.sh
./kickstart.sh --dont-wait --dont-start-it

sudo systemctl start netdata
sudo systemctl enable netdata

echo -e "${GREEN}Netdata kuruldu${NC}"
echo -e "${GREEN}Adres: http://SUNUCU_IP:19999${NC}"
