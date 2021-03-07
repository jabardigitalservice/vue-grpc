FROM node:12.13.0-stretch as build
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn run build

FROM nginx:stable-alpine as production-stage
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
