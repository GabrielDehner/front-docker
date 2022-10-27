FROM node:14 
WORKDIR /usr/src/app/ui
COPY package*.json ./
RUN npm cache clean --force
RUN npm install
RUN npm install -g @angular/cli
COPY . .
EXPOSE 4200
CMD ["npm", "run", "start"]
