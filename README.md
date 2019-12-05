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