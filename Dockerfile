FROM node:alpine
USER root

RUN apk add curl bash expect python2

SHELL ["/bin/bash", "-c"]

RUN curl -o- https://raw.githubusercontent.com/back4app/parse-cli/back4app/installer.sh | /bin/bash \
  && touch /root/.bashrc \
  && export PATH=$PATH:/usr/local/bin >> /root/.bashrc && source /root/.bashrc

COPY . /app

WORKDIR /app

ENTRYPOINT ["/app/deploy.sh"]