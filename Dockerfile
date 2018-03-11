FROM debian:stretch
MAINTAINER Leon Spors

ENV TS_USER="teamspeak" \
    TS_PATH="/usr/local/teamspeak"

RUN apt-get update && \
    apt-get install -y curl wget bzip2 && \
    adduser --home $TS_PATH --shell /bin/bash --disabled-login --gecos "" $TS_USER && \
    wget $(curl -s https://www.teamspeak.com/en/downloads#server | grep -o "http://dl.4players.de/ts/releases/.*/teamspeak3-server_linux_amd64-.*.tar.bz2" | head -n1) -O $TS_PATH/latest.tar.bz2 && \
    tar -xjf $TS_PATH/latest.tar.bz2 -C $TS_PATH && \
    chmod +x $TS_PATH/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh && \
    touch $TS_PATH/teamspeak3-server_linux_amd64/.ts3server_license_accepted && \
    chown -R $TS_USER $TS_PATH

USER $TS_USER
WORKDIR "/usr/local/teamspeak/teamspeak3-server_linux_amd64"
ENTRYPOINT ["ts3server_minimal_runscript.sh"]
