FROM node:latest

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY app/package*.json ./

RUN npm ci --only=production
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY app/. .

ENV PRERENDER_SERVICE_URL http://0.0.0.0:3000

EXPOSE 3000
CMD [ "node", "server.js" ]