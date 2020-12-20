
# Dockerfile References: https://docs.docker.com/engine/reference/builder/
FROM debian:stretch 

# Add Maintainer Info
LABEL maintainer="Yusaku Senga <yusaku@swingby.network>"

# Set the Current Working Directory inside the container
WORKDIR /app

COPY . .

RUN apt-get update -y && apt-get install -y logrotate libsnappy1v5 libzmq5 libgflags2v5

RUN dpkg -i backend-ethereum_1.9.20-979fc968-satoshilabs-1_amd64.deb

RUN dpkg -i blockbook-ethereum_0.3.4_amd64.deb

RUN chmod 775 entrypoint.sh healthcheck.sh

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD "sh -c healthcheck.sh"

EXPOSE 9030 9130
# Command to run the executable
CMD ["./entrypoint.sh"]