FROM nginx:alpine

WORKDIR /usr/share/nginx/html

COPY ./frontend/public .

RUN rm /etc/nginx/conf.d/default.conf

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf