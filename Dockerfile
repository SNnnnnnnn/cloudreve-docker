FROM alpine:latest

ADD cloudreve ./cloudreve
ADD conf.ini ./conf.ini
ADD run.sh ./run.sh


RUN apk update \
    && apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && chmod +x ./cloudreve \
    && chmod +x ./run.sh \
    && mkdir -p /data/aria2 \
    && chmod -R 766 /data/aria2

CMD ./run.sh

EXPOSE 8080
