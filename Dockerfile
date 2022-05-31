FROM nginx:alpine
COPY target/dist/ /usr/share/nginx/html/
EXPOSE 80
