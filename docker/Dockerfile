FROM golang:1.8.0-alpine
ARG NOMAD_VERSION=0.5.5
COPY context /context
RUN apk add --no-cache tar make git gcc musl-dev zip tree bash
WORKDIR $GOPATH/src/github.com/hashicorp/
RUN git clone https://github.com/hashicorp/nomad.git
WORKDIR nomad
RUN git fetch
RUN git checkout v${NOMAD_VERSION} &&\
  make bootstrap &&\
  make bin &&\
  cp $GOPATH/bin/nomad /context/
WORKDIR /context
USER nobody
CMD ["tar", "cz", "."]
