FROM library/golang:1.10-alpine as build

RUN apk update
RUN apk add git
RUN go get github.com/mholt/caddy/caddy
RUN go get github.com/caddyserver/builds

WORKDIR $GOPATH/src/github.com/mholt/caddy/caddy
RUN go run build.go
RUN mkdir /out
RUN cp caddy /out/caddy

FROM library/alpine:3.7

COPY --from=build /out/caddy /usr/local/bin/caddy
RUN mkdir -p /var/lib/caddy && touch /var/lib/caddy/Caddyfile
VOLUME /var/lib/caddy/Caddyfile

EXPOSE 80 443 2015
ENTRYPOINT ["/usr/local/bin/caddy"]
CMD ["-conf", "/var/lib/caddy/Caddyfile"]

