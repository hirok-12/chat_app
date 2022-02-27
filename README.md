# チャットアプリ
Ruby on RailsとVue.jsを使ったリアルタイムチャットアプリ
RailsはAPIモード利用

# 使用技術
- Ruby 2.7.1
- Rails 6.0.4
- node 16.2.0
- vue/cli 4.5.13

# 機能
- ログイン機能
- サインアップ機能
- ログアウト機能
- メッセージの一覧表示機能
- メッセージの作成機能
- メッセージにいいねする機能
- いいねを取り消す機能
- リアルタイムで通信する機能

# 実装されていない機能
- メッセージの削除機能
- チャットルームの作成・選択機能
- 複雑なエラーハンドリング
- 本番デプロイ

# DB構成
User
- uid（id）
- name(名前)
- email(メルアド)
- encrypted_password(暗号化パスワード)
- tokens(認証情報をフロントエンドとやりとりするためのトークン)
- provider(認証プロバイダー)
- created_at（作成日時）
- updated_at（更新日時）

Message
- id(id)
- content(メッセージ内容)
- user_id（ユーザーID）※ 外部キー
- created_at（作成日時）
- updated_at（更新日時）

Like
- Id
- message_id（メッセージID）※ 外部キー
- user_id（ユーザーID）※ 外部キー
- created_at（作成日時）
- updated_at（更新日時）

# APIエンドポイント
- /auth/sign_in(POST) => ログイン機能
- /auth(POST) => サインアップ
- /auth/sign_out(DELETE) => ログアウト機能 ※
- /messages(GET) => メッセージの一覧取得機能 ※
- /messages/:id/likes(POST) => メッセージにいいねする機能 ※
- /likes/:id(DELETE) => いいねを取り消す機能 ※

※がついているのは認証必要（ログイン状態）

# フロントエンドコンポーネント設計
- LoginForm.vue(ログイン画面)
- SignupForm.vue(サインアップ画面)
- Navbar.vue(ナビバー画面)
- ChatWindow.vue(チャットウィンドウ画面)
- NewCharForm.vue(入力画面)