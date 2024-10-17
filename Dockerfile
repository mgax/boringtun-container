FROM rust:slim-bullseye AS build
RUN apt-get update && apt-get install -y libcap2-bin
RUN cargo install --locked boringtun-cli

FROM debian:bullseye-slim AS dist
RUN apt-get update && \
    apt-get install -y --no-install-recommends libcap2-bin wireguard-tools socat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY --from=build /usr/local/cargo/bin/boringtun-cli /usr/local/bin/
