clean:
	rm todo-server/main.pb.go
	rm -rf todo-client/node_modules
	
generate:
	@protoc -I todo-server/ todo-server/main.proto --go_out=plugins=grpc:todo-server
	@mkdir -p todo-client/node_modules
	@protoc --proto_path=todo-server \
	--js_out=import_style=commonjs,binary:todo-client/node_modules/ \
	--grpc-web_out=import_style=commonjs,mode=grpcwebtext:todo-client/node_modules/ \
	todo-server/main.proto