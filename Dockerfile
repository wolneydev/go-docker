FROM golang:1.21.0-alpine3.18 as builder

WORKDIR /app

COPY main.go ./
RUN go mod init example.com/golang
COPY . .
RUN go build -o /server
CMD ["/server"]

FROM scratch
WORKDIR /
COPY --from=builder /server /server
ENTRYPOINT ["/server"]