

#FROM rust:alpine
FROM rust:latest

WORKDIR /home

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget make build-essential git sudo
#RUN apk update && apk upgrade && apk add build-base make git

RUN git clone --depth 1 https://github.com/vigna/webgraph-rs.git && \
	cd webgraph-rs && cargo build --release && \
	cp -r target/release/* /usr/local/bin/ && cd .. && rm -rf webgraph-rs
