FROM node:15

WORKDIR /app

COPY . /app

RUN npm install

