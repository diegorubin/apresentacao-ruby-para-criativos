FROM fedora:26
MAINTAINER rubin.diego@gmail.com

RUN dnf install -y ruby nodejs rubygem-bundler rubygem-json

RUN mkdir /application
WORKDIR /application

ADD Gemfile /application/Gemfile
ADD Gemfile.lock /application/Gemfile.lock
RUN bundle install

ADD examples /application/examples
ADD public /application/public
ADD index.html /application/index.html
ADD presentation-start /application/presentation-start
ADD server.rb /application/server.rb


CMD "./presentation-start"

