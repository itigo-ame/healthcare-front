# ベースイメージを指定（例として Node.js を使用）
FROM node:20.13.1

# 作業ディレクトリを設定
WORKDIR /healthcare-test

# package.json と package-lock.json をコピーして依存関係をインストール
COPY package.json package-lock.json ./

# 依存関係ファイルをコピーしてインストール
RUN npm install

# アプリケーションコードをコピー
COPY . .

# アプリケーションをビルド
RUN npm run build

# serve をインストールしてビルドしたアプリを公開
RUN npm install -g serve

# コンテナ起動時に実行するコマンドを指定（ビルドしたアプリをポート 3000 で公開）
CMD ["serve", "-s", "build", "-l", "3000"]

# 必要に応じて公開ポートを指定
EXPOSE 3000