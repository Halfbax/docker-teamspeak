FROM debian:stretch

MAINTAINER Leon Spors

ENV TS_USER="teamspeak" \
    TS_PATH="/usr/local/teamspeak"

RUN apt-get update && \
    apt-get install -y curl wget bzip2 && \
    adduser --home $TS_PATH --shell /bin/bash --disabled-login --gecos "" $TS_USER

COPY entrypoint.sh $TS_PATH/

RUN chown teamspeak $TS_PATH/entrypoint.sh && \
    chmod +x $TS_PATH/entrypoint.sh

USER $TS_USER

WORKDIR $TS_PATH

EXPOSE 9987/udp 2010/udp 30033 10011 41144 2008

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
