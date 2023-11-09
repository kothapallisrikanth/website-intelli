FROM amazonlinux:latest
RUN yum update -y && yum install -y nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
WORKDIR /usr/share/nginx/html
RUN rm -f /usr/share/nginx/html/index.html
COPY . /usr/share/nginx/html 



