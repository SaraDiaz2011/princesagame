FROM ubuntu:22.04
RUN apt update
RUN apt install apache2 -y
EXPOSE 80
WORKDIR /var/www/html/
COPY . .
CMD ["apachectl", "-D", "FOREGROUND"]