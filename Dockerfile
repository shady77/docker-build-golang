FROM golang:latest
ARG GIT_CHNGLOG_VER=0.8.0
RUN which ssh-agent
RUN apt-get update -y && apt-get install openssh-client git make unzip -y
RUN eval $(ssh-agent -s)
RUN curl -L https://github.com/protocolbuffers/protobuf/releases/download/v3.11.2/protoc-3.11.2-linux-x86_64.zip --output protoc.zip && \
    unzip protoc.zip -d /usr && \
    rm protoc.zip
RUN env GO111MODULE=on go get -u github.com/golang/protobuf/protoc-gen-go && \
    env GO111MODULE=on go get github.com/micro/protoc-gen-micro && \
    env GO111MODULE=on go get -u github.com/golangci/golangci-lint/cmd/golangci-lint && \
    env GO111MODULE=on go get github.com/gojp/goreportcard/cmd/goreportcard-cli && \
    env GO111MODULE=on go get -u github.com/swaggo/swag/cmd/swag
RUN curl -L https://git.io/vp6lP | sh
RUN curl -L https://github.com/git-chglog/git-chglog/releases/download/${GIT_CHNGLOG_VER}/git-chglog_linux_amd64 --output /usr/bin/git-chglog
RUN chmod 777 /usr/bin/git-chglog
