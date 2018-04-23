FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler
RUN mkdir /final
WORKDIR /final
ADD Gemfile /final/Gemfile
ADD Gemfile.lock /final/Gemfile.lock
RUN bundle install
ADD . /final
