FROM ubuntu:24.04

LABEL maintainer="stanley.gomes@icloud.com"

# Update and install basic packages
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy custom bashrc config and append to .bashrc
COPY src/bashrc_custom /tmp/bashrc_custom
RUN cat /tmp/bashrc_custom >> /root/.bashrc && rm /tmp/bashrc_custom

CMD ["bash"]
