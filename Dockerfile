FROM ubuntu:noble
USER root
ENV TZ="Pacific/Auckland"

RUN apt-get update
RUN apt-get install curl sudo nano git wireguard wireguard-tools net-tools iproute2 iptables ca-certificates python3 python3-pip python3-venv python3-full --no-install-recommends -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
