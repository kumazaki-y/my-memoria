<div id="top"></div>

## 主な使用技術
<!-- シールド一覧 -->
<p style="display: inline">
  <!-- フロントエンドのフレームワーク一覧 -->
  <img src="https://img.shields.io/badge/-Node.js-000000.svg?logo=node.js&style=for-the-badge">
  <!-- フロントエンドの言語一覧 -->
  <img src="https://img.shields.io/badge/-Javascript-000.svg?logo=javascript&style=for-the-badge">
  <!-- バックエンドのフレームワーク一覧 -->
  <img src="https://img.shields.io/badge/-Rails-CC0000.svg?logo=rails&style=for-the-badge">
  <!-- バックエンドの言語一覧 -->
  <img src="https://img.shields.io/badge/-Ruby-CC342D.svg?logo=ruby&style=for-the-badge">
  <!-- ミドルウェア一覧 -->
  <img src="https://img.shields.io/badge/-Postgresql-234.svg?logo=postgresql&style=for-the-badge">
  <img src="https://img.shields.io/badge/-Redis-333.svg?logo=redis&style=for-the-badge">
  <!-- インフラ一覧 -->
  <img src="https://img.shields.io/badge/-Docker-1488C6.svg?logo=docker&style=for-the-badge">
  <img src="https://img.shields.io/badge/-Heroku-430098.svg?logo=heroku&style=for-the-badge">

</p>

## 目次

1. [アプリ概要](#アプリ概要)
2. [環境](#環境)
3. [ディレクトリ構成](#ディレクトリ構成)
4. [開発環境構築](#開発環境構築)
5. [トラブルシューティング](#トラブルシューティング)

## アプリ概要
技術力の証明を目的に、ポートフォリオとして[画像投稿アプリ (My_MEMO)](https://kumazaki-insta-app-f96286e3999e.herokuapp.com/users/sign_in) を作成しました。 

スクールで学んだ技術のアウトプットのほか、独自に学習した機能を追加することに挑戦しています。

## 環境
<!-- 言語、フレームワーク、ミドルウェア、インフラの一覧とバージョンを記載 -->

| 言語・フレームワーク  | バージョン |
| --------------------- | ---------- |
| Node.js               |20.11.0     |
| Ruby on Rails         |6.0.6.1     |
| Ruby                  |2.7.7       |
| postgleSQL            |14.9        |
| Redis                 |7.2.4       |


その他のパッケージのバージョンは pyproject.toml と package.json を参照してください

<p align="right">(<a href="#top">トップへ</a>)</p>


## ディレクトリ構成
<!-- Treeコマンドを使ってディレクトリ構成を記載 -->
❯ tree -a -I "node_modules|.next|.git|.pytest_cache|static" -L 2
.
├── .devcontainer
│   └── devcontainer.json
├── .env
├── .github
│   ├── action
│   ├── release-drafter.yml
│   └── workflows
├── .gitignore
├── Makefile
├── README.md
├── backend
│   ├── .vscode
│   ├── application
│   ├── docs
│   ├── manage.py
│   ├── output
│   ├── poetry.lock
│   ├── project
│   └── pyproject.toml
├── containers
│   ├── django
│   ├── front
│   ├── mysql
│   └── nginx
├── docker-compose.yml
├── frontend
│   ├── .gitignore
│   ├── README.md
│   ├── __test__
│   ├── components
│   ├── features
│   ├── next-env.d.ts
│   ├── package-lock.json
│   ├── package.json
│   ├── pages
│   ├── postcss.config.js
│   ├── public
│   ├── styles
│   ├── tailwind.config.js
│   └── tsconfig.json
└── infra
    ├── .gitignore
    ├── docker-compose.yml
    ├── main.tf
    ├── network.tf
    └── variables.tf

## 使用技術 (フロントエンド)
Axios ( ) - 非同期処理、HTTPクライアント

JQuery ( )- 

## 使用技術 (バックエンド)
Ruby (2.7.7) - 開発言語

Ruby on Rails(6.0.6.1.) - Webアプリケーションフレームワーク

postgleSQL (14.9) - RDB

Redis (6.0.10) - キャッシュ、セッションストア

Mailgun - メール送受信

RSpec (5.1.2) - テスト

Rubocop()- コード管理


## 使用技術 (その他)
Docker - コンテナ管理

AWS S3 - ストレージ

Heroku - デプロイ

## 今後取り入れたい技術
GitHub Actions - CI/CD

AWS ECS -

React -



## 機能一覧
・ログイン機能(devise)
  -アイコン設定、ユーザー名登録

・通知機能(MailGun)
  -コメント時にメンションでメール通知

・検索機能
  -テキスト内容検索、ユーザー名検索

・画像投稿機能
  -複数画像の同時アップロード、アイコンクリック後に画像選択でアップロード

・プレビュー機能
  -投稿前の画像を表示

・フォロー機能
  -非同期でフォロー・フォロワー数を増減

・いいね機能
  -非同期で表示画像を変更

・シェア機能
  -Twitter

・抽出機能
  -24時間以内に作成された「いいね」が多い投稿を5つタイムラインに表示
