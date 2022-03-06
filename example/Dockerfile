# 构建：使用golang:1.13版本
FROM golang:1.13 as build

# 容器环境变量添加，会覆盖默认的变量值
ENV GO111MODULE=on CGO_ENABLED=0 GOOS=linux GOPROXY=https://goproxy.cn,direct
ENV WORKSPACE=/workspace/lvm-simple

# 设置工作区
WORKDIR $WORKSPACE

# 把全部文件添加到/go/release目录
ADD . .

# 编译：把cmd/main.go编译成可执行的二进制文件，命名为app
RUN GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -ldflags="-s -w" -installsuffix cgo -o /tmp/controller pkg/controller/main.go
RUN GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -ldflags="-s -w" -installsuffix cgo -o /tmp/scheduler pkg/scheduler/main.go

# 运行：使用scratch作为基础镜像
FROM alpine:latest
# 在build阶段复制时区到
COPY --from=build /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 在build阶段复制可执行的go二进制文件app
COPY --from=build /tmp/scheduler /usr/bin/
COPY --from=build /tmp/controller /usr/bin/
#RUN chmod +x /usr/bin/scheduler && chmod +x /usr/bin/controller

# 启动服务
#CMD ["echo scheduler controller"]