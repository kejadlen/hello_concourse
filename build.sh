#!/bin/bash -e

app="$1"
version=$(cat "$2")

cd "$(dirname "$0")"

case "$app" in
  hello)
    go build -o build/hello services/hello/hello.go
    tar czf "build/hello-${version}.tar.gz" build/hello
    ;;
  *)
    echo "Unknown service \"$app\"!"
    exit 1
esac
