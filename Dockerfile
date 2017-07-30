MAINTAINER rubin.diego@gmail.com
FROM fedora:26

RUN dnf install -y httpd ruby node

RUN mkdir /application

COPY css /application/css
COPY examples /application/examples
COPY js /application/js
COPY lib /application/lib
COPY node_modules /application/node_modules
COPY plugin /application/plugin

COPY bower.json /application/bower.json
COPY Gruntfile.js /application/Gruntfile.js
COPY index.html /application/index.html
COPY package.json /application/package.json

