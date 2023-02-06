FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx

RUN openssl \
		-req \
		-x509 \
		-days 365 \
		-newkey rsa:4069 \
		-keyout /etc/ssl/private/libacchu.42.fr.key \
		-out /etc/ssl/cert/libacchu.42.fr.crt
		-sub "/C=DE/ST=Lower Saxony/L=Hildesheim/O=42 Wolfsburg/OU=students/CN=libacchu.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d 

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
 