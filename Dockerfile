FROM node:19-alpine as builder

WORKDIR /nodejs

COPY . /nodejs

RUN yarn

EXPOSE 3000

CMD [ "yarn", "start:dev"]
