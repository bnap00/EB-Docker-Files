FROM alpine

RUN apk add --update nfs-utils 
ADD ./entry.sh /etc/init.d/entry.sh
RUN chmod +x /etc/init.d/entry.sh
ENTRYPOINT sh
