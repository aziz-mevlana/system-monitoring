#!/bin/bash
ORANGE='\033[0;33m'
NC='\033[0m'

echo -e "${ORANGE}Sunucu test yukune giriyor 60 saniye surecek${NC}"
echo -e "${ORANGE}Net data panelinden cpu grafigini izle${NC}"

openssl speed -multi $(nproc) > /dev/null &
PID=$!

sleep 60

kill -9 -$PID 2>/dev/null || pkill -f openssl
echo -e "${ORANGE}Test bitti${NC}"

