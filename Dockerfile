FROM alpine as build
RUN apk add libcap musl-dev cargo
RUN cargo install --locked boringtun-cli

FROM alpine as dist
RUN apk add libgcc wireguard-tools socat
COPY --from=build /root/.cargo/bin/boringtun-cli /usr/local/bin/
