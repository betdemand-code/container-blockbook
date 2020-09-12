
# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM debian:latest as builder

# Add Maintainer Info
LABEL maintainer="Yusaku Senga <yusaku@swingby.network>"

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
RUN apt-get update && apt-get install -y \
    build-essential git wget pkg-config libzmq3-dev libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev

COPY . .

RUN chmod 775 install_go.sh && ./install_go.sh

RUN chmod 775 install_rocksdb.sh && ./install_rocksdb.sh

RUN chmod 775 install_zeromq.sh && ./install_zeromq.sh

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN chmod 775 build_blockbook.sh && ./build_blockbook.sh

# Copy the source from the current directory to the Working Directory inside the container
# Build the Go app

######## Start a new stage from scratch #######
FROM gcr.io/distroless/base-debian10

WORKDIR /var/app

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /app/binary .

# Command to run the executable
ENTRYPOINT ["/var/app/binary"]