FROM debian:latest

RUN apt-get update && \
	apt-get install -y nginx \
	openssl

COPY ./conf/nginx.conf /etc/nginx/conf.d 

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
