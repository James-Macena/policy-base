FROM ruby:3.1.4-alpine as build

WORKDIR /opt/app/

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    bash

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
