FROM alpine as builder

WORKDIR /app

ADD https://github.com/pocketbase/pocketbase/releases/download/v0.6.0/pocketbase_0.6.0_linux_amd64.zip /tmp/

RUN unzip /tmp/pocketbase_0.6.0_linux_amd64.zip && rm -rf /tmp/


FROM alpine

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /app

COPY --from=builder /app/pocketbase /app/

EXPOSE 8090

ENTRYPOINT [ "/app/pocketbase","serve","--http=0.0.0.0:8090" ]
