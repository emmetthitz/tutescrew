FROM golang:1.8.3-alpine3.6

LABEL Name=tutescrew Version=0.0.1

RUN mkdir -p /go/src/github.com/albshin/tutescrew

ADD . /go/src/github.com/albshin/tutescrew

RUN apk --no-cache add git

RUN go get -d github.com/albshin/tutescrew
RUN go install github.com/albshin/tutescrew

RUN apk del git

# Copy config over to binary
RUN cp /go/src/github.com/albshin/tutescrew/config.json /go/bin/config.json

RUN chmod -R 700 /go/bin/tutescrew

WORKDIR /go/bin
ENTRYPOINT /go/bin/tutescrew

EXPOSE 8080