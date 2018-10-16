FROM library/golang:1.11.1-alpine as build

RUN apk add --no-cache git \
  && go get github.com/mholt/caddy/caddy \
  && go get github.com/caddyserver/builds

WORKDIR $GOPATH/src/github.com/mholt/caddy/caddy
RUN sed -i 's/var EnableTelemetry.*/var EnableTelemetry = false/' caddymain/run.go \
  && cat caddymain/run.go \
  && go run build.go \
  && mkdir /out \
  && cp caddy /out/caddy

FROM library/alpine:3.7

RUN apk add --no-cache --update ca-certificates

COPY --from=build /out/caddy /usr/local/bin/caddy

EXPOSE 80 443 2015
ENTRYPOINT ["/usr/local/bin/caddy"]
CMD ["-agree", "-conf", "/var/lib/caddy/Caddyfile"]

