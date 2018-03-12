#!/bin/bash

wget $(curl -s https://www.teamspeak.com/en/downloads#server | grep -o "http://dl.4players.de/ts/releases/.*/teamspeak3-server_linux_amd64-.*.tar.bz2" | head -n1) -O $TS_PATH/latest.tar.bz2 && \
tar -xjf ./latest.tar.bz2 -C $TS_PATH
chmod +x ./teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh

if [ -n "$LICENSE" ]; then
    if [ "$LICENSE" = "accept" ]; then
        touch ./teamspeak3-server_linux_amd64/.ts3server_license_accepted
    fi
fi

if [ -d ./mounted ]; then
    #if [ ! -d ./mounted/logs ]; then
    #    mkdir ./mounted/logs
    #fi

    if [ ! -f /usr/local/teamspeak/teamspeak3-server_linux_amd64/.ts3server_license_accepted -a -f /usr/local/teamspeak/mounted/.ts3server_license_accepted ]; then
        ln -sf /usr/local/teamspeak/mounted/.ts3server_license_accepted /usr/local/teamspeak/teamspeak3-server_linux_amd64/
    fi
    ln -sf /usr/local/teamspeak/mounted/ts3server* /usr/local/teamspeak/teamspeak3-server_linux_amd64/

    startARGS="logpath=/usr/local/teamspeak/mounted/logs licensepath=/usr/local/teamspeak/mounted/"
fi

./teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh $startARGS
