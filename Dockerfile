FROM ubuntu:16.04

MAINTAINER wezhyn wezhyn@163.com
ARG ssrLibev=shadowsocksr-libev-2.5.3
ARG ssrFormate=.tar.gz



COPY ./$ssrLibev$ssrFormate /root

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g  /etc/apt/sources.list && \
    apt-get update && \
    mkdir -p /root/ssr && \
    tar -zxf /root/$ssrLibev$ssrFormate -C /root/ssr  && \
    apt-get install --no-install-recommends build-essential autoconf libtool \
    libssl-dev libpcre3-dev asciidoc xmlto zlib1g-dev curl bc -y  && \
    cd /root/ssr/$ssrLibev &&   ./configure && make && \
    make install && \
    apt-get autoclean && rm -rf /var/lib/apt/lists/*

CMD ["bash"]


