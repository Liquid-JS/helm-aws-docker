FROM alpine:3.4

ENV KUBE_LATEST_VERSION=v1.14.9
ENV HELM_VERSION=v2.16.3
ENV HELM_FILENAME=helm-${HELM_VERSION}-linux-amd64.tar.gz

RUN apk add --update ca-certificates \
    && apk add --update -t deps curl  \
    && apk add --update gettext tar gzip \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && curl -L https://storage.googleapis.com/kubernetes-helm/${HELM_FILENAME} | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
    && chmod +x /usr/local/bin/kubectl \
    && apk del --purge deps \
    && rm /var/cache/apk/*

ENTRYPOINT ["/bin/helm"]

RUN apk add --update py-pip \
    && pip install awscli \
    && wget -O docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-19.03.5.tgz \
    && tar -xzvf docker.tgz \
    && cp docker/* /bin/ \
    && rm -rf docker* \
    && rm /var/cache/apk/*
