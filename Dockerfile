FROM ubuntu:24.04

LABEL maintainer="stanley.gomes@icloud.com"

# Update and install basic packages
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install curl
RUN curl

# Set working directory
WORKDIR /app

CMD ["bash"]
