FROM alpine:edge


RUN set -eu && \
    apk update && \
		apk upgrade && \
		apk add --no-cache curl tinyproxy && \
		rm -rf /tmp/* /var/cache/apk/*
	
COPY --chmod=0755 startup.sh /bin/startup

EXPOSE 8888

HEALTHCHECK CMD curl -fsS -x http://localhost:8888 https://google.com -o /dev/null || exit 1

ENTRYPOINT [ "/bin/startup" ]
