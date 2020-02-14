FROM alpine:3.10

ARG HELM_VERSION=2.16.3

ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"

RUN apk add --update --no-cache curl libressl ca-certificates && \
  curl -L ${BASE_URL}/${TAR_FILE} | tar xvz && \
  mv linux-amd64/helm /usr/bin/helm && \
  mv linux-amd64/tiller /usr/bin/tiller && \
  chmod +x /usr/bin/helm && \
  chmod +x /usr/bin/tiller && \
  rm -rf linux-amd64 && \
  apk del curl && \
  rm -f /var/cache/apk/* && \
  helm init --client-only
