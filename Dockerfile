FROM golang:1.13-alpine as builder

WORKDIR /go/src/app
COPY . .
RUN go build main.go

FROM hello-world

COPY --from=builder /go/src/app .

CMD ["/main"]