#!/bin/sh

# Peers checker 
# 
# by NorD 02.12.19


if [ x$1 = x ];then
        echo "Usage: $0 discovery|peer"
        exit 1
fi

peers(){
        sudo asterisk -x 'sip show peers' | cut -d ' ' -f 1 | cut -d '/' -f 1 | sed -n '1!p' | grep 100[0-9][0-9] # последний grep - в личных целях. Регулируется через регулярки 
}

discovery(){
        peers | awk -v ORS="" 'BEGIN { print "{\"data\":["} { print "{\"{#NUMBER}\":\""$1"\"}," } END { print "]}" }' | sed 's/,]}$/]}\n/'
}

check(){
        sudo asterisk -rx 'database show' | grep /SIP/Registry/$1 | wc -l
}


if [ $1 = "discovery" ]; then
        discovery
else
        check $1
fi