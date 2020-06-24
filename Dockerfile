FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt-get install php7.3 php7.3-fpm php7.3-mbstring php7.3-mysql php7.3-curl -y
RUN apt-get install php7.3-cli php7.3-fpm php7.3-mysql php7.3-json php7.3-opcache php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl -y
RUN mkdir -p /var/www/html
WORKDIR /tmp
RUN apt-get install wget
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
RUN cp -r wordpress/* /var/www/html/
RUN chown -R www-data:www-data /var/www/html
EXPOSE 9000
