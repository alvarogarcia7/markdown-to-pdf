FROM node:15 # This is not working with 'buster' as it cannot find openssl inside

WORKDIR /app

COPY . /app

RUN npm install

