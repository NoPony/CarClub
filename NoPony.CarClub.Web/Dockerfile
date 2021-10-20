### STAGE 1: Build app
FROM node:14.15-alpine AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Compile container
FROM nginx:latest
#COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/ClientApp /usr/share/nginx/html
