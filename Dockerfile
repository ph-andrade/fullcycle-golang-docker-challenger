FROM golang as go

WORKDIR /go/src

COPY ./main.go .

RUN go mod init fullcycle.com/main && \
    go build main.go


FROM hello-world
  COPY --from=go /go/src/main .
  CMD ["/main"]

