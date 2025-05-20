FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
EXPOSE 3000
CMD ["/bin/sh", "-c", "/wait-for-it.sh mysql:3306 -- node src/app.js"]