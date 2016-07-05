FROM dockerfile/nginx

ADD nginx-site /etc/nginx/sites-enabled/default

COPY . /app/

CMD ["nginx"]

EXPOSE 80
