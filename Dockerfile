FROM golang:1.21-alpine AS builder

WORKDIR /app

# دریافت و ساخت برنامه
RUN apk add --no-no-cache git
RUN git clone https://github.com/Ahmd-Aba/Slipstream.git .
RUN go build -o slipstream-server ./cmd/server

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/slipstream-server .

# متغیر پورتی که Railway ارائه می‌دهد
ENV PORT=8080
EXPOSE ${PORT}

CMD ["./slipstream-ser
ver"]
