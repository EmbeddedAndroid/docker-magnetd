FROM ubuntu:17.10

RUN apt-get update && \
    apt-get --no-install-recommends --yes install \
         build-essential \
         libtool \
         automake \
         git \
         autotools-dev \
         autoconf \
         pkg-config \
         libssl-dev \
         libgmp3-dev \
         libevent-dev \
         software-properties-common \
         python-software-properties \
         bsdmainutils

RUN apt-get update && \
    apt-get --no-install-recommends --yes install \
         libboost-all-dev

RUN add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get --no-install-recommends --yes install \
          libdb4.8-dev \
          libdb4.8++-dev 

RUN apt-get update && \
    apt-get --no-install-recommends --yes install \
         libminiupnpc-dev

WORKDIR /magnet

ENV MAGNET_VERSION v1.4.2

RUN wget https://github.com/magnetwork/magnet/releases/download/$MAGNET_VERSION/magnet-qt-LINUX.tar.gz && \
    tar -C . -xaf magnet-qt-LINUX.tar.gz && \
    chmod a+x magnetd

VOLUME ["/root/.magnet"]

EXPOSE 17179 17177

ENTRYPOINT ["/magnet/magnetd"]
