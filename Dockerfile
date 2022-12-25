# Bulder
FROM node:19-alpine as builder

WORKDIR /nodejs
COPY . /nodejs/
RUN yarn
RUN yarn build

# Runner
FROM node:19-alpine

WORKDIR /nodejs
COPY --from=builder /nodejs/dist /nodejs/dist
COPY --from=builder /nodejs/package.json /nodejs/package.json
RUN yarn --production
EXPOSE 3000
CMD [ "yarn", "start:prod"]

