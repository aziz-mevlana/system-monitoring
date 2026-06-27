#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}Netdata sunucudan temizleniyor${NC}"

if [ -f /usr/libexec/netdata/netdata-unistaller.sh ]; then
	sudo /usr/libexec/netdata/netdata-unistaller.sh --force --yes
fi

rm -f kickstart.sh
echo -e "${RED}Sunucu temizlendi${NC}"
