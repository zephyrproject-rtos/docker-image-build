FROM quay.io/buildah/stable:v1.35.0

# Install Podman.
RUN dnf -y install podman

# Use VFS storage driver by default because FUSE is not available inside
# unprivileged runner containers.
RUN sed -i 's/driver = .*/driver = "vfs"/' /etc/containers/storage.conf

# Set XDG_RUNTIME_DIR to ensure that Podman correctly resolves temporary
# directory path.
ENV XDG_RUNTIME_DIR="/tmp/users/0"
RUN mkdir -p $XDG_RUNTIME_DIR

# Create a dummy Docker config file because 'podman-login' action requires it.
RUN \
	mkdir -p $HOME/.docker && \
	echo '{ "auths": {} }' > $HOME/.docker/config.json
