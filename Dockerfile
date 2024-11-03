FROM node:latest

WORKDIR /app

# npm を最新バージョンに更新
RUN npm install -g npm@latest

# npm キャッシュをクリア
RUN npm cache clean --force

COPY package*.json ./

# 依存関係をインストール
RUN npm install

RUN npm install react-scripts

COPY . .

CMD ["npm", "start"]
