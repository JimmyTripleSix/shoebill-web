FROM trion/ng-cli as builder
WORKDIR /app
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm ci  --debug
COPY . .
RUN ng build --prod


FROM nginx:alpine
COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder  /app/dist/shoebill-web /usr/share/nginx/html
CMD /bin/bash -c nginx -g 'daemon off;'
