FROM ubuntu:noble
USER root
ENV TZ="Pacific/Auckland"

RUN apt-get update
RUN apt-get install --no-install-recommends -y curl nano git wireguard wireguard-tools net-tools python3.10 python3.10-distutils --no-install-recommends -y

RUN git clone -q https://github.com/donaldzou/WGDashboard.git /etc/wgdashboard
RUN cd /etc/wgdashboard/src
RUN chmod u+x wgd.sh
RUN ./wgd.sh install
RUN echo "net.ipv4.ip_forward=1" >>/etc/sysctl.conf
RUN sysctl -p /etc/sysctl.conf

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD bash /etc/wgdashboard/src/wgd.sh start
