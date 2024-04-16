#!/bin/sh

# This build.sh file was borrowed from https://github.com/bogdanfinn/tls-client/blob/master/cffi_whatsmeow/build.sh
# make sure you have installed all build tools on your machine

case "$1" in
"amd64"|"")
  echo 'Build for Linux x86_64'
  GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build -buildmode=c-shared -ldflags=-s -o ./whatsmeow/whatsmeow-linux-amd64.so main.go
;;&
"arm64"|"")
  echo 'Build for Linux ARM64'
  GOOS=linux GOARCH=arm64 CGO_ENABLED=1 CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ go build -buildmode=c-shared -ldflags=-s -o ./whatsmeow/whatsmeow-linux-arm64.so main.go
;;&
"x86"|"")
  echo 'Build for Linux 686'
  GOOS=linux GOARCH=386 CGO_ENABLED=1 go build -buildmode=c-shared -o ./whatsmeow/whatsmeow-linux-686.so main.go
;;&
"386"|"")
  echo 'Build for Linux 386'
  GOOS=linux GOARCH=386 CGO_ENABLED=1 go build -buildmode=c-shared -o ./whatsmeow/whatsmeow-linux-386.so main.go
;;&
"win64"|"")
  echo 'Build for Windows x86_64'
  GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -buildmode=c-shared -o ./whatsmeow/whatsmeow-windows-64.dll main.go
;;&
#"win32"|"") # TODO
#  echo 'Build for Windows x86'
#  GOOS=windows GOARCH=386 CGO_ENABLED=1 CC=i686-w64-mingw32-gcc go build -buildmode=c-shared -o ./whatsmeow/whatsmeow-windows-32.dll main.go
#;;&
#"osxarm64"|"") # TODO
#  echo 'Build OSX ARM64'
#  GOOS=darwin GOARCH=arm64 go build -o ./whatsmeow/whatsmeow-darwin-arm64.dylib -buildmode=c-shared main.go
#;;&
#"osxamd64"|"") # TODO
#  echo 'Build OSX x86_64'
#  GOOS=darwin GOARCH=amd64 go build -buildmode=c-shared -o ./whatsmeow/whatsmeow-darwin-amd64.dylib main.go
esac
