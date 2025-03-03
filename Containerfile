ARG BASE_IMAGE=alpine:latest
 
FROM ${BASE_IMAGE}

# Update the package index and install necessary packages
RUN apk update && apk add --no-cache \
    bash \
    tini \
    python3 \
    py3-pip \
    openssh-client

RUN apk add --no-cache \
    ansible \
    ansible-lint

# create the user, ansible
RUN adduser -D ansible
RUN mkdir /home/ansible/.ssh && chown ansible:ansible /home/ansible/.ssh

# customize ssh configs:
COPY ./ssh_config /etc/ssh/ssh_config.d/custom_ssh.conf
RUN chmod 644 /etc/ssh/ssh_config.d/*

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["tini","/entrypoint.sh"]
# Set the working directory
WORKDIR /app
USER ansible