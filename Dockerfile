FROM lwolf/helm-kubectl-docker:latest

RUN apk add --update py-pip \
    && pip install awscli \
    && wget -O docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-19.03.5.tgz \
    && tar -xzvf docker.tgz \
    && cp docker/* /bin/ \
    && rm -rf docker* \
    && rm /var/cache/apk/*
