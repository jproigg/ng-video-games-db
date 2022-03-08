FROM node:10-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

RUN npm install -g ng-cli

COPY . /app

RUN ng build 

FROM nginx:1.17.1-alpine

COPY --from=build-step /app/dist/ng-video-game-db /usr/share/nginx/html