
# Requires grpc and protoc-gen-go
# https://grpc.io/docs/quickstart/go.html#install-grpc
protoc bitumrates.proto --go_out=plugins=grpc:.
