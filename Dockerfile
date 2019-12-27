FROM debian:buster-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends sane sane-utils imagemagick nodejs npm

RUN echo 'localhost' > /etc/sane.d/net.conf

RUN npm install npm@latest -g

COPY . .

RUN npm install

RUN node_modules/gulp/bin/gulp.js

ENTRYPOINT ["node", "server.js"]
