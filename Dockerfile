ARG BUILD_IMAGE=alpine
ARG BUILD_IMAGE_TAG=3.15.1

FROM ${BUILD_IMAGE}:${BUILD_IMAGE_TAG}

# Install prerequisits
SHELL ["/bin/sh", "-euxo", "pipefail", "-c"]
# hadolint ignore=DL3018
RUN apk update --no-cache ;\
  apk add --no-cache \
    bash \
    ca-certificates \
    openssh \
    curl

# Get latest k3sup
RUN curl -sLS \
  https://get.k3sup.dev | sh

WORKDIR /data
CMD ["k3sup", "version"]