# タスクリスト

## 1. 要件定義
- [ ] 要件定義をまとめる (requirements.mdファイルを作成)

## 2. コンテキスト管理
- [ ] UserContextを作成し、ユーザー名と更新関数を定義
- [ ] 初期ユーザー名を「初期ユーザー」に設定

## 3. ホームページ
- [ ] Homeコンポーネントでユーザー名を表示
- [ ] Aboutページへのリンクボタンを追加

## 4. Aboutページ
- [ ] Aboutコンポーネントでユーザー名を表示
- [ ] ユーザー名を変更するボタンと入力プロンプトを追加
- [ ] Homeページへのリンクボタンを追加

## 5. アーキテクチャ図
- [ ] アーキテクチャ図を作成 (arch.pu)

## 6. Docker構成
- [ ] Dockerfileを作成
- [ ] docker-compose.ymlを作成

## 7. コーディング

### 7.1 プロジェクトのセットアップ
- [ ] Reactアプリのセットアップ
  - [ ] 
Creating a new React app in /Users/ksk_aiko/Documents/Projects/CrossComponentCommunication/user-context-app.

Installing packages. This might take a couple of minutes.
Installing react, react-dom, and react-scripts with cra-template...


added 1312 packages in 47s

259 packages are looking for funding
  run `npm fund` for details

Initialized a git repository.

Installing template dependencies using npm...

added 47 packages, and changed 1 package in 7s

263 packages are looking for funding
  run `npm fund` for details
Removing template package using npm...


removed 1 package, and audited 1359 packages in 5s

263 packages are looking for funding
  run `npm fund` for details

8 vulnerabilities (2 moderate, 6 high)

To address all issues (including breaking changes), run:
  npm audit fix --force

Run `npm audit` for details.

Created git commit.

Success! Created user-context-app at /Users/ksk_aiko/Documents/Projects/CrossComponentCommunication/user-context-app
Inside that directory, you can run several commands:

  npm start
    Starts the development server.

  npm run build
    Bundles the app into static files for production.

  npm test
    Starts the test runner.

  npm run eject
    Removes this tool and copies build dependencies, configuration files
    and scripts into the app directory. If you do this, you can’t go back!

We suggest that you begin by typing:

  cd user-context-app
  npm start

Happy hacking!
  - [ ] 

### 7.2 コンポーネントの実装

#### 7.2.1 UserContextProviderコンポーネント
- [ ] ユーザー名とsetUserName関数を定義

#### 7.2.2 Homeコンポーネント
- [ ] ユーザー名表示とAboutページへのナビゲーション

#### 7.2.3 Aboutコンポーネント
- [ ] ユーザー名表示とユーザー名変更機能

### 7.3 動作確認
- [ ] アプリケーションを起動して動作確認
  - [ ] 

## 8. テスト

### 8.1 ユニットテスト
- [ ] ユーザー名が正常に表示されるかテスト
- [ ] Aboutページでのユーザー名変更が正常に機能するかテスト

### 8.2 統合テスト
- [ ] 各ページ間のナビゲーションが正常に機能するかテスト
