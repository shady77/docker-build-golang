FROM golang:latest
RUN which ssh-agent || ( apt-get update -y && apt-get install openssh-client git -y )
RUN eval $(ssh-agent -s)
RUN go get github.com/micro/protobuf/{proto,protoc-gen-go}
RUN go get -u github.com/swaggo/swag/cmd/swag
RUN go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
RUN go get github.com/gojp/goreportcard/cmd/goreportcard-cli
