FROM alpine:3

WORKDIR /app

COPY . .

RUN apk add sane sane-utils imagemagick nodejs npm

RUN echo 'localhost' > /etc/sane.d/net.conf

RUN npm install

RUN node_modules/gulp/bin/gulp.js

ENTRYPOINT ["server.js"]
