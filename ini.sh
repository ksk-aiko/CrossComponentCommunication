#!/bin/bash

# プロジェクトフォルダ構成を作成
mkdir -p requirement diagrams src public

# 1. 要件定義ファイルの作成
cat <<EOL > requirement/requirements.md
# Requirements

## 目的
Reactアプリケーション内でのuseContextフックを活用したユーザー情報の共有および管理方法の学習。

## 機能要件
1. ユーザー情報のコンテキスト管理
   - useContextフックを使用して、アプリケーション全体でユーザー名を共有。
   - 初期ユーザー名を「初期ユーザー」に設定。

2. ホームページ
   - 現在のユーザー名を表示するメッセージを表示。
   - useContextで取得したユーザー名を表示。

3. Aboutページ
   - 現在のユーザー名を表示し、「ユーザー名を変更」ボタンを提供。
   - ボタンをクリックすると、新しいユーザー名の入力を求めるプロンプトが表示され、入力した名前でユーザー名が更新される。

4. ページ間のナビゲーション
   - 「Homeに戻る」と「Aboutページへ」のボタンでページを切り替え可能。
   
## 非機能要件
- 効率的なコンテキスト管理
- シンプルなUI
EOL

# 2. タスクリストファイルの作成
cat <<EOL > requirement/task.md
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
  - [ ] `npx create-react-app user-context-app`
  - [ ] `cd user-context-app`

### 7.2 コンポーネントの実装

#### 7.2.1 UserContextProviderコンポーネント
- [ ] ユーザー名とsetUserName関数を定義

#### 7.2.2 Homeコンポーネント
- [ ] ユーザー名表示とAboutページへのナビゲーション

#### 7.2.3 Aboutコンポーネント
- [ ] ユーザー名表示とユーザー名変更機能

### 7.3 動作確認
- [ ] アプリケーションを起動して動作確認
  - [ ] `npm start`

## 8. テスト

### 8.1 ユニットテスト
- [ ] ユーザー名が正常に表示されるかテスト
- [ ] Aboutページでのユーザー名変更が正常に機能するかテスト

### 8.2 統合テスト
- [ ] 各ページ間のナビゲーションが正常に機能するかテスト
EOL

# 3. Dockerfileの作成
cat <<EOL > Dockerfile
# Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]
EXPOSE 3000
EOL

# 4. docker-compose.ymlの作成
cat <<EOL > docker-compose.yml
version: '3'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - CHOKIDAR_USEPOLLING=true
EOL

# 5. アーキテクチャ図 (diagrams/arch.pu)
cat <<EOL > diagrams/arch.pu
@startuml
package "Context" {
    class UserContextProvider {
        - userName: string = "初期ユーザー"
        + setUserName(newName: string): void
    }
    UserContextProvider --> Home : provides context
    UserContextProvider --> About : provides context
}

package "Components" {
    class Home {
        + render(): JSX
    }
    class About {
        + render(): JSX
        + handleChangeUserName(): void
    }
    Home --> UserContextProvider : useContext
    About --> UserContextProvider : useContext
}
@enduml
EOL

# 6. ユースケース図 (diagrams/usecase.pu)
cat <<EOL > diagrams/usecase.pu
@startuml
actor User
rectangle App {
  User --> (View Home Page)
  User --> (Navigate to About Page)
  User --> (Change User Name)
}
@enduml
EOL

# 7. アクティビティ図 (diagrams/activity.pu)
cat <<EOL > diagrams/activity.pu
@startuml
|User|
start
:View Home Page;
if (Navigate to About Page?) then (yes)
  :View About Page;
  if (Change User Name?) then (yes)
    :Prompt for New User Name;
    :Update User Name in Context;
  endif
endif
stop
@enduml
EOL

# 8. シーケンス図 (diagrams/sequence.pu)
cat <<EOL > diagrams/sequence.pu
@startuml
User -> Home : Visits Home
Home -> UserContext : Display userName
User -> About : Navigates to About
About -> UserContext : Display userName
User -> About : Clicks Change User Name
About -> UserContext : Updates userName
@enduml
EOL

# 9. コンポーネント図 (diagrams/component.pu)
cat <<EOL > diagrams/component.pu
@startuml
package "App Components" {
  component App {
    App --> UserContextProvider
  }
  component UserContextProvider {
    UserContextProvider --> Home
    UserContextProvider --> About
  }
  component Home
  component About
}
@enduml
EOL

# 10. クラス図 (diagrams/class.pu)
cat <<EOL > diagrams/class.pu
@startuml
class UserContextProvider {
    - userName: string = "初期ユーザー"
    + setUserName(newName: string): void
}

class Home {
    + render(): JSX
}

class About {
    + render(): JSX
    + handleChangeUserName(): void
}

UserContextProvider --> Home : useContext
UserContextProvider --> About : useContext
@enduml
EOL

# 11. Reactアプリの主要ファイル (src/index.js)
cat <<EOL > src/index.js
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

ReactDOM.render(<App />, document.getElementById('root'));
EOL

# 12. App.jsの作成 (src/App.js)
cat <<EOL > src/App.js
import React from 'react';
import { BrowserRouter as Router, Route, Switch, Link } from 'react-router-dom';
import UserContextProvider from './UserContextProvider';
import Home from './Home';
import About from './About';

function App() {
    return (
        <UserContextProvider>
            <Router>
                <nav>
                    <Link to="/">Home</Link> | <Link to="/about">About</Link>
                </nav>
                <Switch>
                    <Route exact path="/" component={Home} />
                    <Route path="/about" component={About} />
                </Switch>
            </Router>
        </UserContextProvider>
    );
}

export default App;
EOL

# 13. UserContextProvider.jsの作成 (src/UserContextProvider.js)
cat <<EOL > src/UserContextProvider.js
import React, { useState, createContext } from 'react';

export const UserContext = createContext();

const UserContextProvider = ({ children }) => {
    const [userName, setUserName] = useState("初期ユーザー");

    const updateUserName = (newName) => {
        setUserName(newName);
    };

    return (
        <UserContext.Provider value={{ userName, updateUserName }}>
            {children}
        </UserContext.Provider>
    );
};

export default UserContextProvider;
EOL

# 14. Home.jsの作成 (src/Home.js)
cat <<EOL > src/Home.js
import React, { useContext } from 'react';
import { UserContext } from './UserContextProvider';

const Home = () => {
    const { userName } = useContext(UserContext);

    return (
        <div>
            <h1>Welcome, {userName}!</h1>
            <p>This is the home page.</p>
        </div>
    );
};

export default Home;
EOL

# 15. About.jsの作成 (src/About.js)
cat <<EOL > src/About.js
import React, { useContext } from 'react';
import { UserContext } from './UserContextProvider';

const About = () => {
    const { userName, updateUserName } = useContext(UserContext);

    const handleChangeUserName = () => {
        const newName = prompt("Enter new user name:");
        if (newName) {
            updateUserName(newName);
        }
    };

    return (
        <div>
            <h1>About Page</h1>
            <p>Current User Name: {userName}</p>
            <button onClick={handleChangeUserName}>Change User Name</button>
        </div>
    );
};

export default About;
EOL

# 16. その他のファイル (public/index.html)
cat <<EOL > public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Context App</title>
</head>
<body>
    <div id="root"></div>
</body>
</html>
EOL

# 17. パッケージ設定ファイル (package.json)
cat <<EOL > package.json
{
  "name": "user-context-app",
  "version": "1.0.0",
  "main": "src/index.js",
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "dependencies": {
    "react": "^18.0.0",
    "react-dom": "^18.0.0",
    "react-router-dom": "^6.0.0"
  },
  "devDependencies": {}
}
EOL

echo "プロジェクトの初期化が完了しました。"
