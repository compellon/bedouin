FROM alpine:3.5
ARG NOMAD_VERSION=0.5.4
RUN apk add --no-cache ruby go make git musl-dev bash &&\
  mkdir -p /tmp/src/github.com/hashicorp/ &&\
  cd /tmp/src/github.com/hashicorp/ &&\
  git clone https://github.com/hashicorp/nomad.git &&\
  cd nomad &&\
  git checkout v${NOMAD_VERSION} &&\
  export GOPATH=/tmp &&\
  export PATH=/tmp/bin:$PATH &&\
  make bootstrap &&\
  make dev &&\
  make install &&\
  cd / &&\
  rm -rf /tmp/* &&\
  apk del go make git musl-dev bash &&\
  gem install --no-document bedouin
USER nobody
ENTRYPOINT ["bedouin"]
