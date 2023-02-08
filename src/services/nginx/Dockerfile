FROM debian:buster

RUN apt-get update 
RUN	apt-get install -y \
		nginx \
		openssl

# RUN mkdir /etc/ssl

COPY ./conf/nginx.conf /etc/nginx/conf.d/default

RUN openssl req \
		-newkey rsa:4069 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-keyout /etc/ssl/private/libacchu.42.fr.key \
		-out /etc/ssl/certs/libacchu.42.fr.crt \
		-subj "/C=DE/ST=Lower Saxony/L=Hildesheim/O=42 Wolfsburg/OU=students/CN=libacchu.42.fr"

# COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
 