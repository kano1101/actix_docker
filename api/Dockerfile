FROM rust:1.60.0 as builder
# FROM rust:1.55.0 as builder

RUN USER=root cargo new --bin app
WORKDIR /app

COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
RUN rustup component add rustfmt
RUN cargo build --release
RUN rm src/*.rs

# COPY ./proto ./proto
# COPY ./build.rs ./build.rs
COPY ./src ./src

RUN cargo install --locked --path .

FROM debian:buster-slim
RUN apt-get update && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/target/release/api .
EXPOSE 8080
CMD ["./api"]
