FROM ruby:2.6-slim

RUN apt-get update && \
    apt-get install --quiet --yes --no-install-recommends \
      curl \
      gnupg

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
    tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
    apt-get install --quiet --yes --no-install-recommends \
      build-essential \
      git \
      libpq-dev \
      imagemagick \
      nodejs \
      yarn \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile* ./
RUN gem install bundler:2.1.4
RUN bundle install -j4 --retry 3

COPY . .

ENTRYPOINT ["./app-entrypoint.sh"]
CMD ["./app-init.sh"]
