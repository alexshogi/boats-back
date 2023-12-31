FROM node:18-alpine3.17

WORKDIR /app

COPY . /app

RUN yarn install
RUN yarn build

CMD yarn start
