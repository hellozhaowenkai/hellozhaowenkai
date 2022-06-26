FROM nginx:stable-alpine

ENV TZ=Asia/Shanghai

WORKDIR /app

COPY /about-me /app/html

EXPOSE 8888

ENTRYPOINT ["nginx", "-g", "daemon off;"]

CMD ["-p", "/app", "-c", "/etc/nginx/nginx.conf"]
