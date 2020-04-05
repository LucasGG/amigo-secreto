FROM ruby:2.6

RUN apt-get update && \
    apt-get install --quiet --yes --no-install-recommends \
      build-essential \
      git \
      libpq-dev \
      nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile* ./
RUN gem install bundler -v 2.1.4
RUN bundle install -j4 --retry 3

COPY . .

ENTRYPOINT ["./app-entrypoint.sh"]
CMD ["./app-init.sh"]
