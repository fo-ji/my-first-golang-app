# build環境
FROM golang:1.20.2-alpine as builder

WORKDIR /app

# 必要なツールをインストール
RUN apk add --no-cache git sqlite-dev gcc musl-dev

# Go モジュールファイルをコピーして依存関係を取得
COPY go.mod go.sum ./
RUN go mod download

# アプリケーションコードをコピーしてビルド
COPY . .
RUN go build -o main .

# 実行環境
FROM alpine
RUN apk add --no-cache sqlite
WORKDIR /app

# アプリケーションをコピー
COPY --from=builder /app/main .
COPY ./sqlite.db ./sqlite.db

# アプリケーションを実行
CMD ["./main"]