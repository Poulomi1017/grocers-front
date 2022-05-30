#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN $(npm bin)/ng build
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/client /usr/share/nginx/html