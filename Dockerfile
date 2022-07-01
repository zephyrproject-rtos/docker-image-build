FROM ubuntu:20.04

ARG DOCKER_URL="https://download.docker.com/linux/static"
ARG DOCKER_CHANNEL=stable
ARG DOCKER_VERSION=20.10.9

# Set default shell during Docker image build to bash
SHELL ["/bin/bash", "-c"]

# Set non-interactive frontend for apt-get to skip any user confirmations
ENV DEBIAN_FRONTEND=noninteractive

# Install updates
RUN apt-get -y update && \
	apt-get -y upgrade

# Install base packages
RUN apt-get install --no-install-recommends -y \
	software-properties-common \
	lsb-release \
	ca-certificates \
	curl \
	file \
	git \
	git-core \
	iptables \
	sudo \
	supervisor \
	wget

# Install Docker
RUN \
	case "$(uname -m)" in \
		aarch64) DOCKER_ARCH="aarch64" ;; \
		x86_64) DOCKER_ARCH="x86_64" ;; \
	esac; \
	wget -O docker.tar.gz \
		"${DOCKER_URL}/${DOCKER_CHANNEL}/${DOCKER_ARCH}/docker-${DOCKER_VERSION}.tgz"; \
	tar xf docker.tar.gz --strip-components 1 -C /usr/local/bin; \
	rm -f docker.tgz;
