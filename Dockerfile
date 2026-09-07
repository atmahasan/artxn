FROM golang:1.21-alpine AS builder
RUN apk add --no-cache git
RUN go install gitlab.com/yawning/dnstt.git/dnstt-server@latest

FROM alpine:latest
COPY --from=builder /root/go/bin/dnstt-server /usr/local/bin/
EXPOSE 53/udp
CMD ["sh", "-c", "dnstt-server -udp :${PORT:-53} -pubkey $PUBKEY -privkey $PRIVKEY $DOMAIN 127.0.0.1:${TARGET_PORT:-8080}"]
