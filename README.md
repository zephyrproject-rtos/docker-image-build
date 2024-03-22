# docker-image-build

This repository contains the Dockerfile for building a Docker image that
includes Buildah and Podman for building OCI images (including Docker images).

It is intended to be used in the self-hosted GitHub Actions CI runners (e.g.
zephyr-runner v2) that do not have these components installed and configured by
default.
