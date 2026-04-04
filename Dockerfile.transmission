FROM debian:bookworm AS builder

ARG TRANSMISSION_VERSION

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    curl \
    pkg-config \
    python3 \
    libssl-dev \
    libcurl4-openssl-dev \
    libevent-dev \
    libminiupnpc-dev \
    libnatpmp-dev \
    zlib1g-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN curl -L https://github.com/transmission/transmission/releases/download/${TRANSMISSION_VERSION}/transmission-${TRANSMISSION_VERSION}.tar.xz \
    -o transmission.tar.xz

RUN tar -xf transmission.tar.xz

WORKDIR /build/transmission-${TRANSMISSION_VERSION}

RUN cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_DAEMON=ON \
    -DENABLE_UTILS=OFF \
    -DENABLE_CLI=OFF \
    -DENABLE_GTK=OFF \
    -DENABLE_QT=OFF \
    -DENABLE_TESTS=OFF


RUN cmake --build build --parallel 6

RUN cmake --install build --prefix /usr

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    libssl3 \
    libcurl4 \
    libevent-2.1-7 \
    libminiupnpc17 \
    libnatpmp1 \
    zlib1g \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr /usr

RUN mkdir -p /config /downloads /incomplete /watch

ENV TRANSMISSION_HOME=/config \
    TRANSMISSION_DOWNLOAD_DIR=/downloads \
    TRANSMISSION_INCOMPLETE_DIR=/incomplete \
    TRANSMISSION_WATCH_DIR=/watch \
    TRANSMISSION_RPC_PORT=9091 \
    TRANSMISSION_PEER_PORT=51413

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9091 51413 51413/udp
VOLUME ["/config", "/downloads", "/incomplete", "/watch"]

ENTRYPOINT ["/entrypoint.sh"]
