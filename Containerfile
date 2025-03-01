ARG BASE_IMAGE=alpine:latest
 
FROM ${BASE_IMAGE}

# Update the package index and install necessary packages
RUN apk update && apk add --no-cache \
    bash \
    tini \
    python3 \
    py3-pip

RUN apk add --no-cache \
    ansible \
    ansible-lint

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["tini","/entrypoint.sh"]
# Set the working directory
WORKDIR /app


