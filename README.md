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
5. [機能紹介](#機能紹介)

## アプリ概要
技術力の証明を目的に、ポートフォリオとして[画像投稿アプリ (My_MEMO)](https://kumazaki-insta-app-f96286e3999e.herokuapp.com/users/sign_in) を作成しました。 

スクールで学んだ技術のアウトプットのほか、独自に学習した機能を追加することに挑戦しています。

## 技術スタック
<!-- 言語、フレームワーク、ミドルウェア、インフラの一覧とバージョンを記載 -->
### フロントエンド
| 名称          | 説明                                     |
| ------------- | ------------------------------       |
| Node.js  20.11.0|  JavaScriptライブラリのビルドに使用         |
| Bootstrap       | グリッドシステムによるレスポンシブ表示        |
|Axios            | HTTPクライアント、非同期処理           |
|JQuery            |                                        |

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
| Redis  7.2.4     |キャッシュやセッション管理 |

### インフラ・デプロイメント
| 名称            | 説明                                       |
| --------------- | ------------------------------            |
| Docker 20.10.7           | 開発・本番環境のコンテナ化             |
| Docker Compose  1.29.2   |  マルチコンテナの管理                 |
| Heroku                   | デプロイメントプラットフォーム             |
| GitHub                   | バージョン管理                       |
|AWS S3                    |画像のストレージ|

### テスト
| 名称      | 説明           |
| --------- | -------------- |
| RSpec     | バックエンドテスト |

### その他のツール
| 名称          | 説明                           |
| ------------- | ------------------------------ |
| RuboCop       | Rubyコードの静的解析           |

<p align="right">(<a href="#top">トップへ</a>)</p>

## インフラ構成図
![インフラ構成図]()


## ER図
![ER図](https://github.com/kumazaki-y/kumazaki-insta-app/assets/139770475/0a87b02c-dbb2-4603-8003-10d262b1dfbe)


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
