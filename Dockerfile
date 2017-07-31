FROM fedora:26
MAINTAINER rubin.diego@gmail.com

RUN dnf install -y ruby nodejs rubygem-bundler

RUN mkdir /application

ADD css /application/css
ADD examples /application/examples

WORKDIR /application/examples
RUN bundle install

ADD js /application/js
ADD lib /application/lib
ADD node_modules /application/node_modules
ADD plugin /application/plugin

ADD bower.json /application/bower.json
ADD Gruntfile.js /application/Gruntfile.js
ADD index.html /application/index.html
ADD package.json /application/package.json
ADD presentation-start /application/presentation-start

WORKDIR /application

CMD presentation-start

