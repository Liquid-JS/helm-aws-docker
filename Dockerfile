FROM alpine:3.9

ENV K8S_VERSION=v1.14.9
ENV HELM_VERSION=v3.1.0
ENV HELM_FILENAME=helm-${HELM_VERSION}-linux-amd64.tar.gz

RUN apk add --update ca-certificates \
    && apk add --update -t deps curl  \
    && apk add --update gettext tar gzip  \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && curl -L https://get.helm.sh/${HELM_FILENAME} | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
    && chmod +x /usr/local/bin/kubectl \
    && apk add --update py-pip \
    && pip install awscli \
    && wget -O docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-19.03.5.tgz \
    && tar -xzvf docker.tgz \
    && cp docker/* /bin/ \
    && rm -rf docker* \
    && apk del --purge deps \
    && rm /var/cache/apk/*

CMD ["helm"]
