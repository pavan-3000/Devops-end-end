FROM node:latest AS base

WORKDIR /hello

COPY package.json .

RUN npm install

COPY . .

FROM node:16-alpine

WORKDIR /hello

COPY --from=base /hello /hello

EXPOSE 3000

CMD [ "npm","start" ]