FROM node:12.15.0 AS builder
WORKDIR /home/node/app
ADD package.json /home/node/app/
ADD . /home/node/app
RUN yarn
RUN yarn prod

FROM nginx:alpine
COPY /nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /home/node/app/build /usr/share/nginx/html
EXPOSE 8080
