FROM node:lts-alpine
ENV NODE_ENV=production \
    PORT=8000 \
    SECRET=star \
    DATABASE=mongodb://admin:admin@ac-ekmme0r-shard-00-00.knmxsou.mongodb.net:27017,ac-ekmme0r-shard-00-01.knmxsou.mongodb.net:27017,ac-ekmme0r-shard-00-02.knmxsou.mongodb.net:27017/?ssl=true&replicaSet=atlas-4ir39s-shard-0&authSource=admin&retryWrites=true&w=majority
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 8000
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]