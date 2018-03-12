#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

for i in $(seq 1 18); do
        printf "ti$i "
        ANS=$(ssh -oStrictHostKeyChecking=no ti$i 2>/dev/null 'ps aux | grep -v grep | grep mate-session | wc -l')
        if [ -z $ANS ]; then
                printf "${RED}not reachable${NC}\n"
        else
                if (( $ANS > 1 )); then
                        printf "${RED}in use${NC}\n"
                else
                        printf "${GREEN}free${NC}\n"
                fi
        fi
done
exit 0

