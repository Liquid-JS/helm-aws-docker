# helm-aws-docker

[![GitHub license](https://img.shields.io/github/license/Liquid-JS/helm-aws-docker.svg)](https://github.com/Liquid-JS/helm-aws-docker/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/liquidjs/helm-aws-docker.svg)](https://hub.docker.com/r/liquidjs/helm-aws-docker/)

Helm, AWS CLI, Kubect, and Docker all packed into a single container.

## Usage

This image is primarily aimed to serve as an environment for running deploy jobs, e.g.

```yml
deploy:
  image: liquidjs/helm-aws-docker:latest
  variables:
    AWS_ACCESS_KEY_ID: "..."
    AWS_SECRET_ACCESS_KEY: "..."
    AWS_DEFAULT_REGION: "..."
    KUBECONFIG: "..."
  script:
    - aws s3 sync [...]
    - helm install [...]
```

## License

[MIT License](https://github.com/Liquid-JS/helm-aws-docker/blob/master/LICENSE)
