FROM golang:latest
ARG GIT_CHNGLOG_VER=0.8.0
ARG PROTOC_VERSION=3.12.4
RUN which ssh-agent
RUN apt-get update -y && apt-get install openssh-client git make unzip -y
RUN eval $(ssh-agent -s)
RUN curl -L https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip --output protoc.zip && \
    unzip protoc.zip -d /usr && \
    rm protoc.zip && \
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.25.1
RUN env GO111MODULE=on go get -u github.com/golang/protobuf/protoc-gen-go && \
    env GO111MODULE=on go get github.com/micro/protoc-gen-micro && \
    env GO111MODULE=on go get github.com/gojp/goreportcard/cmd/goreportcard-cli && \
    env GO111MODULE=on go get -u github.com/swaggo/swag/cmd/swag
