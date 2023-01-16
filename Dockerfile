FROM alpine
RUN apk add libcap musl-dev cargo wireguard-tools socat
RUN cargo install boringtun-cli
RUN mv /root/.cargo/bin/boringtun-cli /usr/local/bin/
