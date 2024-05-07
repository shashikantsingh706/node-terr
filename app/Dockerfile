FROM node:19.6

WORKDIR /app

COPY /app/package*.json ./
COPY .. ./
RUN npm install
CMD ["node", "app/index.js"]