    FROM ubuntu
    RUN apt update
    RUN apt install -y wget
    RUN apt install -y unzip
    RUN apt update
    RUN apt install -y apache2
    RUN chmod -R 777 /var/www/html
    COPY . /var/www/html
    RUN apt clean
    EXPOSE 80
    CMD ["apache2ctl", "-D", "FOREGROUND"]