FROM ruby:2.4-alpine
RUN gem install --no-document bedouin
COPY nomad /usr/local/bin/nomad
USER nobody
ENTRYPOINT ["bedouin"]
