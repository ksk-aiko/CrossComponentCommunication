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
