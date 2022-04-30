# build stage
FROM node:lts-alpine as build-stage
WORKDIR /hello-world
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#
FROM nginx
COPY /hello-world/dist    /usr/share/nginx/html