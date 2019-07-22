FROM golang:latest
ARG GIT_CHNGLOG_VER=0.8.0
RUN which ssh-agent || ( apt-get update -y && apt-get install openssh-client git make -y )
RUN eval $(ssh-agent -s)
RUN go get github.com/micro/protobuf/proto
RUN go get github.com/micro/protobuf/protoc-gen-go
RUN go get -u github.com/swaggo/swag/cmd/swag
RUN go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
RUN go get github.com/gojp/goreportcard/cmd/goreportcard-cli
RUN curl -L https://git.io/vp6lP | sh
RUN curl -L https://github.com/git-chglog/git-chglog/releases/download/${GIT_CHNGLOG_VER}/git-chglog_linux_amd64 --output /usr/bin/git-chglog
RUN chmod 777 /usr/bin/git-chglog
