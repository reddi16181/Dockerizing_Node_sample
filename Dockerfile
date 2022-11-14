FROM node:16 as base

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

EXPOSE 5000

#code for production
FROM base as production
ENV NODE_ENV=production
RUN npm ci --only=production
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .
CMD [ "node", "server.js" ]

#code for development
FROM base as dev
ENV NODE_ENV=development
RUN npm install -g nodemon && npm install

# Bundle app source
COPY . .
CMD [ "nodemon", "server.js" ]
