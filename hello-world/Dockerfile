RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

# build stage
FROM node:lts-alpine as build-stage
WORKDIR /hello-world
COPY package*.json ./
RUN npm install
COPY .. .
RUN npm run build

#
FROM nginx
COPY /hello-world/dist    /usr/share/nginx/html