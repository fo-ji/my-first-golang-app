# 開発環境構築ガイド

このプロジェクトでは、Dockerを使用して開発環境を構築します。本ガイドにしたがって、ローカル環境でコンテナーを起動してください。

## 前提条件

以下のツールがローカル環境にインストールされている必要があります。
- Docker Desktop

## 環境構築手順
1. リポジトリをクローン
```bash
git clone git@github.com:fo-ji/my-first-golang-app.git
cd my-first-golang-app
```

2. Dockerイメージをビルド
```bash
docker compose build
```

3. コンテナーを起動
```bash
docker compose up
```

4. コンテナーの停止
```bash
docker compose down
```