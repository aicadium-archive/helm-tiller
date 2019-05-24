ARG HELM_VERSION=2.14.0

FROM alpine/helm:${HELM_VERSION}

ARG HELM_VERSION=2.14.0

RUN apk add --update --no-cache curl libressl ca-certificates \
    && helm init --client-only \
    && curl -L https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar xvz \
    && mv linux-amd64/tiller /usr/bin/tiller \
    && chmod +x /usr/bin/tiller \
    && rm -rf linux-amd64 \
    && apk del curl \
    && rm -f /var/cache/apk/*
