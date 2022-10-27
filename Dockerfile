# To build and compile Angular
FROM node:16 as node
WORKDIR /app
COPY ./ /app/
RUN npm install
ARG configuration=production
RUN npm run build -- --configuration=$configuration

# Copy to ready for production with Nginx
FROM nginx:alpine
EXPOSE 80
COPY --from=node /app/dist/front-docker /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
