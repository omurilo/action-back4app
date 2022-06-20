FROM alpine:3.11
USER root

RUN apk add curl bash expect python2

SHELL ["/bin/bash", "-c"]

COPY . /app

WORKDIR /app

# RUN curl -o- https://raw.githubusercontent.com/back4app/parse-cli/back4app/installer.sh | /bin/bash \
#   && touch /root/.bashrc \
#   && export PATH=$PATH:/usr/local/bin >> /root/.bashrc && source /root/.bashrc

RUN /app/installation-b4a.sh \
  && touch /root/.bashrc \
  && export PATH=$PATH:/usr/local/bin >> /root/.bashrc && source /root/.bashrc

ENTRYPOINT ["/app/deploy.sh"]