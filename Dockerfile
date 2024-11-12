# ベースイメージを指定（例として Node.js を使用）
FROM node:20.13.1

# 作業ディレクトリを設定
WORKDIR /healthcare-test

# 依存関係ファイルをコピーしてインストール
RUN npm install

# アプリケーションコードをコピー
COPY . .

# コンテナ起動時に実行されるコマンドを指定
CMD ["npm", "start"]

# 必要に応じて公開ポートを指定
EXPOSE 3000