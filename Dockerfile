FROM ruby:3.1.4-alpine as build

WORKDIR /opt/policy-base

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    curl \
    bash \
    vim

ENV EDITOR=vim

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
