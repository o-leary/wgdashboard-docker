FROM ubuntu:noble
USER root
ENV TZ="Pacific/Auckland"

RUN apt-get update
RUN apt-get install curl sudo nano git wireguard wireguard-tools net-tools ca-certificates python3 python3-pip python3-venv --no-install-recommends -y

RUN git clone -q https://github.com/donaldzou/WGDashboard.git /etc/wgdashboard
RUN cd /etc/wgdashboard/src
RUN chmod u+x wgd.sh
RUN bash /etc/wgdashboard/src/wgd.sh install
RUN echo "net.ipv4.ip_forward=1" >>/etc/sysctl.conf
RUN sysctl -p /etc/sysctl.conf

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD bash /etc/wgdashboard/src/wgd.sh start
