FROM ruby:2.7-alpine

RUN apk update && apk add build-base nodejs npm postgresql-dev chromium chromium-chromedriver

RUN mkdir /app
WORKDIR /app

COPY package.json yarn.lock Gemfile Gemfile.lock ./
RUN npm install -g yarn && bundle install --binstubs && yarn install

COPY . .

LABEL maintainer="Josh Klina"

CMD puma -C config/puma.rb
