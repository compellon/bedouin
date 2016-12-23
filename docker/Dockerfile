FROM alpine
ARG NOMAD_VERSION=0.5.0
RUN apk add --no-cache wget ca-certificates unzip ruby &&\
  wget -q https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip &&\
  unzip -d /usr/local/bin nomad_${NOMAD_VERSION}_linux_amd64.zip &&\
  rm nomad_${NOMAD_VERSION}_linux_amd64.zip &&\
  chmod +x /usr/local/bin/nomad &&\
  gem install --no-document bedouin
USER nobody
ENTRYPOINT ["bedouin"]
