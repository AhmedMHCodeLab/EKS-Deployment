FROM nginx:1.29.3-alpine3.22

WORKDIR /usr/share/nginx/html
RUN rm -rf ./* \
	&& apk update \
	&& apk upgrade

COPY index.html .
COPY js/ ./js/
COPY style/ ./style/
COPY meta/ ./meta/
COPY favicon.ico .

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]