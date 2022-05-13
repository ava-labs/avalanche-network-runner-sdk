#!/usr/bin/env bash
set -e

if ! [[ "$0" =~ genproto.sh ]]; then
  echo "must be run from repository root"
  exit 255
fi

go install -v google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install -v google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# https://docs.buf.build/installation
buf lint
buf generate

echo "ALL SUCCESS"
