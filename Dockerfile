FROM ruby:2.7-alpine

RUN apk update && apk add build-base nodejs npm postgresql-dev chromium chromium-chromedriver

RUN mkdir /app
WORKDIR /app

COPY package.json yarn.lock Gemfile Gemfile.lock ./
RUN npm install -g yarn
RUN bundle install --binstubs
RUN yarn install

COPY . .

# The ENV variables simply need to be set for Rails to correctly pre-compile
# your assets. They do not need to be populated by real values.
RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=dummytoken assets:precompile SECRET_KEY_BASE=dummy

LABEL maintainer="Josh Klina"

CMD puma -C config/puma.rb
