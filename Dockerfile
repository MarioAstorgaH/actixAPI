# syntax=docker/dockerfile:1
FROM rust:1.93.0-alpine3.23 AS build
WORKDIR /src
COPY . Cargo.lock Cargo.toml ./
RUN mkdir src && echo "fn main(){}" > src/main.rs
RUN cargo build --release 
RUN rm -f target/release/deps/myapp*

COPY . .
RUN cargo build --release

CMD [ "myapp" ]
