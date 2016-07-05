FROM ruby:2.1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Docker can cache the bundle install if adding the Gemfile separately
ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/
RUN bundle install

ADD . /usr/src/app

EXPOSE 4567
CMD ["rackup"]
