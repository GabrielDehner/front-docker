# To build and compile Angular
FROM node:alpine as build 
WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY . .
RUN npm run build
FROM nginx 
EXPOSE 80
COPY --from=build /app/dist/front-docker /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
