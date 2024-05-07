# Use Alpine Linux as base image
FROM hashicorp/terraform:latest

# Install required packages
RUN apk update && apk upgrade --no-cache &&\
    apk add --no-cache \
    ca-certificates \
    openssl \
    wget \
    curl \
    unzip \
    python3 \
    py3-pip \
    bash \
    && rm -rf /var/cache/apk/*

# Install Google Cloud SDK (gcloud)
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin


# Install AWS CLI
# RUN apk add aws-cli

# Install Azure CLI
# RUN apk add --no-cache --virtual .build-deps \
#     build-base \
#     libffi-dev \
#     openssl-dev \
#     cargo \
#     && apk add azure-cli \
#     && apk del .build-deps

# Set environment variables for Azure CLI
# ENV AZURE_CORE_COLLECT_TELEMETRY=false

# Set up entry point
ENTRYPOINT [ "/bin/bash" ]