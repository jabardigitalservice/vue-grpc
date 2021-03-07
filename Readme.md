# vue-grpc

```console
git clone https://github.com/jabardigitalservice/vue-grpc.git
```

## Requirements

### On OSX

```console
brew install protobuf
```

### On Linux

```console
# Make sure you grab the latest version
curl -OL https://github.com/google/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip

# Unzip
unzip protoc-3.6.1-linux-x86_64.zip -d protoc3

# Move protoc to /usr/local/bin/
sudo mv protoc3/bin/* /usr/local/bin/

# Move protoc3/include to /usr/local/include/
sudo mv protoc3/include/* /usr/local/include/
```


## Install Protobuf Generator for Go

```console
go get -u github.com/golang/protobuf/protoc-gen-go
```

## Install Protobuf Generator for Web

### On OSX

```console
brew install protoc-gen-grpc-web
```

### On Linux

```console
git clone https://github.com/grpc/grpc-web /tmp/grpc-web
cd /tmp/grpc-web && sudo make install-plugin
rm -rf /tmp/grpc-web
cd -
```

## Generate proto and grpc_web

```console
make generate
```

## Clean proto and grpc_web

```console
make clean
```

## Build with docker-compose

```console
docker-compose up -d
```