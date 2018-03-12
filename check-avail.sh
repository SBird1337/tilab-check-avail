#!/bin/bash

for number in {1..16}
do
    wc=$(ssh -o 'StrictHostKeyChecking no' ti$number '((ps aux | grep -v grep) | grep mate-session) | wc -l')
    if [ "$wc" = "0" ]
    then
        echo -e "ti$number is \033[0;32mavailable\033[0m"
    else
        echo -e "ti$number is \033[0;31mnot available\033[0m"
    fi
done
exit 0
