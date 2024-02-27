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
2. [技術スタック](#技術スタック)
3. [インフラ構成図](#インフラ構成図)
4. [ER図](#ER図)
5. [機能一覧](#機能一覧)

## アプリ概要
技術力の証明を目的に、ポートフォリオとして[画像投稿アプリ (My_MEMO)](https://my-memoria-f96286e3999e.herokuapp.com/users/sign_in) を作成しました。 

スクールで学んだ技術のアウトプットのほか、独自に学習した機能を追加することに挑戦しています。

## 技術スタック
<!-- 言語、フレームワーク、ミドルウェア、インフラの一覧とバージョンを記載 -->
### フロントエンド
| 名称          | 説明                                     |
| ------------- | ------------------------------       |
| Node.js 20.11.0|  JavaScriptライブラリのビルドに使用         |
| Bootstrap 4.5.2 | グリッドシステムによるレスポンシブ表示        |
|Axios            | HTTPクライアント、非同期処理           |

### バックエンド
| 名称                    |     説明             |
| -------------           | --------------         |
| Ruby on Rails  6.0.6.1|  バックエンドフレームワーク      |
| Ruby 2.7.7            |   スクリプト言語        |
|Mailgun                |      メール送受信    |
|Devise                  | 認証機能             |  

### データベース
| 名称               | 説明                             |
| ---------        | -------------------------------- |
| PostgreSQL 14.9  | データベース              |
| Redis  7.2.4     |キャッシュ・セッション管理 |

### インフラ・デプロイメント
| 名称            | 説明                                       |
| --------------- | ------------------------------            |
| Docker 20.10.7           | 開発環境のコンテナ化             |
| Docker Compose  1.29.2   |  マルチコンテナ管理                 |
| Heroku                   | デプロイメントプラットフォーム             |
| GitHub                   | バージョン管理                       |
|GitHub Actions            |自動デプロイ|
|AWS S3                    |画像ストレージ|

### テスト
| 名称      | 説明           |
| --------- | -------------- |
| RSpec     | バックエンドテスト |

<p align="right">(<a href="#top">トップへ</a>)</p>

## インフラ構成図
![インフラ構成図](https://github.com/kumazaki-y/my-memoria/assets/139770475/07c2efac-d86e-40ef-a1ac-7a0f814565df)


## ER図
![ER図](https://github.com/kumazaki-y/my-memoria/assets/139770475/0a87b02c-dbb2-4603-8003-10d262b1dfbe)


## 機能一覧
| 名称          | 説明                           |
| ------------- | ------------------------------ |
| ユーザー機能       | 	ゲストログイン、新規登録、アイコン変更、フォロー          |
|投稿機能          |画像を投稿・削除。複数同時投稿、プレビュー表示|
|コメント機能    |投稿にコメント。非同期で表示・投稿|
|いいね機能    |投稿にいいね。非同期で表示切り替え|
|検索機能        |テキスト・ユーザー名で投稿検索|
|通知機能        |コメント時にメンションでメール通知|
|シェア機能        |投稿をTwitterにシェア|
|フィード機能      |「いいね」が多い投稿を5つタイムラインに表示|
