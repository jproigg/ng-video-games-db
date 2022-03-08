FROM node:10-alpine 

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build 


#FROM nginx:1.17.1-alpine

#COPY --from=build-step /app/dist/ng-video-game-db /usr/share/nginx/html