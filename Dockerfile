FROM nginx:1.25.3-alpine

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*

COPY index.html .
COPY js/ ./js/
COPY style/ ./style/
COPY meta/ ./meta/
COPY favicon.ico .

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]