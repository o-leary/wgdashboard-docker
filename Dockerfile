FROM ubuntu:noble
USER root
ENV TZ="Pacific/Auckland"

RUN apt-get update
RUN apt-get install curl sudo nano git wireguard wireguard-tools net-tools iproute2 ca-certificates python3 python3-pip python3-venv python3-full --no-install-recommends -y

RUN echo "net.ipv4.ip_forward=1" >>/etc/sysctl.conf
RUN sysctl -p /etc/sysctl.conf

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
