FROM alpine

RUN apk add --update nfs-utils 
ADD ./entry.sh /entry.sh
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh" ]