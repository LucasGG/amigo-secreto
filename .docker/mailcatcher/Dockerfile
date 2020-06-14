FROM ruby:2.6-alpine

RUN apk add --no-cache --update sqlite-libs

RUN apk add --no-cache --virtual .build-deps \
      build-base \
      sqlite-dev \
    && gem install mailcatcher --no-document \
    && apk del .build-deps

EXPOSE 1025 1080

CMD ["mailcatcher", "--foreground", "--ip", "0.0.0.0"]
