FROM ruby:2.6

RUN apt-get update && \
    apt-get install --quiet --yes --no-install-recommends \
      build-essential \
      git \
      libpq-dev \
      nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile* ./

RUN gem update --system && \
    gem install bundler -v 2.1.4 --no-document && \
    bundle install --jobs=4 --retry 3

COPY . .

ENTRYPOINT ["./docker-app-entrypoint.sh"]
CMD ["./docker-app-init.sh"]
