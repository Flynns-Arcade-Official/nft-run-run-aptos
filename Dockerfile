FROM node:18-slim as base

FROM base as builder

WORKDIR /app

COPY package.json /app

RUN yarn install

ADD . .

RUN yarn build

FROM base as runner

WORKDIR /app

COPY --from=builder /app .

CMD ["npm", "run", "dev"]
