# ポートフォリオ紹介

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
[My-Memoria](https://www.my-memoria.com) は画像を投稿してユーザーと交流できるアプリです。

スクールで学んだ技術のアウトプットのほか、独自に学習した機能の追加に挑戦しています。

ゲストログイン可能なのでぜひお試しください！

### トップページ
[![ログイン画面](https://i.gyazo.com/107f15b413194959320716f319644e41.jpg)](https://gyazo.com/107f15b413194959320716f319644e41)

### レスポンシブ対応
スマホサイズでもレイアウトは崩れません。

[![レスポンシブ](https://i.gyazo.com/5895a0cd755870f3218a5347d97b5a0a.png)](https://gyazo.com/5895a0cd755870f3218a5347d97b5a0a)

### 画像投稿
画像は同時に複数枚投稿でき、プレビュー表示もされます。
[![画像投稿](https://i.gyazo.com/7e48d02de510e67f18f443ed14457ee0.gif)](https://gyazo.com/7e48d02de510e67f18f443ed14457ee0)

### 非同期処理
フォロー、アイコン変更、コメント、いいねは非同期で動作します。

[![フォロー](https://i.gyazo.com/cf0c2da0c0d0b0b059cc78a7127eba32.gif)](https://gyazo.com/cf0c2da0c0d0b0b059cc78a7127eba32)
[![アイコン変更](https://i.gyazo.com/2864aa1f6b871dc3cc12b273cfdbdedc.gif)](https://gyazo.com/2864aa1f6b871dc3cc12b273cfdbdedc)
[![コメント](https://i.gyazo.com/d9a93c1710ea20b36c0e30d3ef97b22b.gif)](https://gyazo.com/d9a93c1710ea20b36c0e30d3ef97b22b)
[![いいね](https://i.gyazo.com/f229ea179a8674076e4d47bb4ccd1a14.gif)](https://gyazo.com/f229ea179a8674076e4d47bb4ccd1a14)

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
draw.io使用
![インフラ構成図](https://github.com/kumazaki-y/my-memoria/assets/139770475/19045e64-8059-4c9a-8918-888213648fd9)



## ER図
![ER図](https://github.com/kumazaki-y/my-memoria/assets/139770475/6723b491-6943-4408-a0a3-4fb785d07629)


## 機能一覧
| 名称          | 説明                           |
| ------------- | ------------------------------ |
| ユーザー機能       | 	ゲストログイン、新規登録、アイコン変更、フォロー          |
|投稿機能          |画像を投稿・削除、複数同時投稿、プレビュー表示|
|コメント機能    |投稿にコメント、非同期で表示・投稿|
|いいね機能    |投稿にいいね、非同期で表示切り替え|
|検索機能        |テキスト・ユーザー名で投稿検索|
|通知機能        |コメント時にメンションでメール通知|
|シェア機能        |投稿をTwitterにシェア|
|フィード機能      |「いいね」が多い投稿を5つタイムラインに表示|
