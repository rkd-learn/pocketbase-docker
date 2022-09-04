FROM alpine as builder

WORKDIR /app

ADD https://github.com/pocketbase/pocketbase/releases/download/v0.6.0/pocketbase_0.6.0_linux_amd64.zip /tmp/

RUN unzip /tmp/pocketbase_0.6.0_linux_amd64.zip && rm -rf /tmp/


FROM alpine

WORKDIR /app

COPY --from=builder /app/pocketbase /app/

ENTRYPOINT [ "/app/pocketbase","serve" ]
