
# Dockerfile References: https://docs.docker.com/engine/reference/builder/
FROM ubuntu:20.04

# Add Maintainer Info
LABEL maintainer="Yusaku Senga <yusaku@swingby.network>"

# Set the Current Working Directory inside the container
WORKDIR /app

COPY . .

RUN apt-get update -y && apt-get install -y logrotate libsnappy1v5 libzmq5 psmisc

RUN dpkg -i backend-bitcoin-testnet_22.0-satoshilabs-1_amd64.deb

RUN dpkg -i blockbook-bitcoin-testnet_0.3.6_amd64.deb

RUN chmod 775 entrypoint.sh

EXPOSE 9030 9130
# Command to run the executable
CMD ["./entrypoint.sh"]