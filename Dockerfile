FROM ubuntu:14.04
MAINTAINER Steven Skoczen <steven@buddyup.org>
CMD ["node", "server.js"]

EXPOSE 5000
RUN mkdir -p /code
VOLUME /code

# Update the OS
RUN apt-get update  # April 11 2016

# Install the base languages & tools
RUN rm -rf /usr/lib/node_modules/npm
RUN apt-get install -y curl git npm nodejs nano

## Carrying on
RUN npm install -g n
RUN n 4.3.1
RUN n use 4.3.1

# Prep the app for updating.
WORKDIR /code

# Set up server.
COPY package.json /code/package.json
RUN npm install

# Set up DNS
RUN if ! cat /etc/hosts | grep "dev.firebase.bu" > /dev/null ; then echo '127.0.0.1 dev.firebase.bu test.firebase.bu' >> /etc/hosts; fi
