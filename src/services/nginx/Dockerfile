FROM debian:buster

RUN apt-get update 
RUN	apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl

RUN openssl \
		req \
		-newkey rsa:4069 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-out /etc/nginx/ssl/libacchu.42.fr.crt \
		-keyout /etc/nginx/ssl/libacchu.42.fr.key \
		-subj "/C=DE/ST=Lower Saxony/L=Hildesheim/O=42 Wolfsburg/OU=students/CN=libacchu.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d 

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
 