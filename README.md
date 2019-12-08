# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

ログインしたユーザーが記事の投稿とコメントができるブログアプリです。

実装した機能
・記事一覧表示機能
・記事詳細表示機能
・記事投稿機能
・記事削除機能
・ユーザログイン機能
・ユーザログアウト機能
・画像アップロード機能
・ページネーション機能
・コメント機能
・スリック機能
・スムーススクロール機能
・フェードイン表示機能
・単体テスト機能（テストコード）実施
・ransackを用いた記事検索機能。
・タグ付機能

＜機能の確認方法＞
ヘッダーにある新規登録ボタンを押して、ユーザーとパスワードとEメールを打ち込むと、
ユーザー登録ができます。

新規登録してログインした状態になると、ヘッダーにある投稿するボタンが押せるようになります。
画像とタイトルと記事のタイトルを全て打ち込むと、投稿が可能です。
バリデーションが働いており、未記入の項目があると、赤い文字でエラーメッセーが表示されます。

投稿した記事はトップページで一覧で表示され、その記事を投稿したユーザーは、
編集と削除が可能になります。
記事の詳細表示は、画像か記事の文章をクリックすると可能です。
記事の詳細表示は、ログインしていないユーザーでも閲覧可能です。
記事の詳細画面では、ログインしているユーザーがコメントできる仕様にとなっており、
投稿するボタンを押すと、投稿したユーザーの名前と打ち込んだ文章が、
記事の下側に一覧となって反映されます。

# Blog DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|image|text|
|name|string|
### Association
- has_many :tweets
- has_many :comments

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user