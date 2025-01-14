# 環境構築手順

参考：https://qiita.com/tkms13/items/74a9ea4b41302323c4b1

1. docker関連ファイルの作成

Dockerfile
```dockerfile
FROM golang:1.23.4-alpine3.21

WORKDIR /app
```

compose.yaml
```yml
services:
  app:
    container_name: my-first-golang-app
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    volumes:
      - ./:/app
```

2. Dockerイメージをビルド

```bash
docker compose build
```

3. プロジェクトの初期化

```bash
docker compose run --rm app sh
go mod init my-first-golang-app

# 何かしらのモジュールをインストールしてgo.sumを作成
go get github.com/google/uuid

exit
```

4. コンテナーの停止&イメージ削除

```bash
docker compose down

# DockerDesktopでイメージを削除
```

5. Dockerfileの変更&リビルド&main.goの作成
Dockerfile
```dockerfile
FROM golang:1.23.4-alpine3.21

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download \
&& apk add --no-cache gcc musl-dev sqlite-dev sqlite

COPY . .

CMD ["go", "run", "."]
```

```bash
docker compose build
```

main.go
```go
package main
import (
	"fmt"
)
func main() {
	fmt.Println("Hello World!")
}
```

6. 起動
```bash
docker compose up
```