FROM golang:1.3
MAINTAINER Steven Jack <stevenmajack@gmail.com>

RUN apt-get update
RUN apt-get install cmake pkg-config -y

RUN go get -d github.com/libgit2/git2go
WORKDIR $GOPATH/src/github.com/libgit2/git2go

RUN git checkout next
RUN git submodule update --init
RUN make install
RUN go install

RUN go get github.com/codegangsta/cli
RUN go get gopkg.in/yaml.v2
RUN go get github.com/fatih/color

WORKDIR /go