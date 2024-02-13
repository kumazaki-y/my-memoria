# 画像投稿アプリ（My_MEMO）
技術力の証明を目的に、ポートフォリオとして[画像投稿アプリ (My_MEMO)](https://kumazaki-insta-app-f96286e3999e.herokuapp.com/users/sign_in) を作成しました。 

スクールで学んだ技術のアウトプットのほか、カリキュラム外の機能を追加することに挑戦しています。

# 苦労した点
Ajaxを用いた非同期通信でコメントを表示する機能の開発時、JSONレスポンスとHTML表示の区別に苦労しました。

JSONレスポンスとHTML表示を一つのアクションで実行しようとし、HTMLではなく配列が画面全体に表示されてしまう状態に直面。

エラー文が表示されず、失敗の原因が掴めないまま何日も解決できませんでした。

最終的に自分の技術に対する理解が足りていないと自覚し、複数のリソースを参照してJSONレスポンスとHTML表示のアクションを区別することで解決できました。

# 学んだこと
問題解決の際は前提となる知識を調べ、一つ一つ仕組みを理解しながら自分の頭で考えることが重要だと学びました。

ChatGPTにエラー文を解読させ開発していましたが、この体験を通して「AIは明示されていないエラーの解消には弱い」と実感しました。

現在は、バグやエラーの解消は

①AIに原因を推測させる

②自分で周辺知識の公式ドキュメントやQiita/Zennを参照

③解決案を一つずつ検証

という流れで行なっていくのが一番効率的と考え、実践しています。

ただし、チーム開発に携わる際は一人で考えすぎてもいけないと考えています。 

時間を浪費するかもしれないし、もっと優れた解決方法に気づかないかもしれないからです。

①②の工程を素早く済ませつつ、先輩方と「解決の方向性は合ってそうか、他に優れた方法はないか」と意見交換をしながら③に取り組みたいです。 

未経験の自分が先輩方の足を引っ張ってはいけないですが、開発を円滑に進めるためのコミュニケーションは積極的を行う必要があると考えています。



# 今後の展望
一人で何日もエラーと向き合った経験を活かし、実務でもエラーこそ学びのチャンスと認識して粘り強く開発に着手したいです。

何日もエラーと向き合うのは本当に辛くて何度も「永遠に完成しないんじゃないか」「自分には無理だったんだ」と思うこともありました。

しかし、一つずつ紐解いていくうちにエラーは必ず解消できるという実感を得られ、パズルを解いた達成感と大きく成長できた喜びも感じられました。

エンジニアとして働く際にも、まず自分自身の知識を磨き続け「エラーは学びのチャンス！」と捉えて着実に解決していきたいです。

チーム開発の経験がないので、今後はコミットメッセージやブランチの規則性・正確性を意識したり、可読性の高いコードで開発することを意識して開発に取り組みたいと考えています。

直近では、チーム開発の現場で使われているというDockerの導入を実行しました。

今後もチーム開発への参加に向けたキャッチアップを継続して実力を高め、より優れた手法について積極的な意見交換を行いながらチームに貢献できるエンジニアになりたいです。


# 使用技術 (フロントエンド)
Axios ( ) - 非同期処理、HTTPクライアント

JQuery ( )- 

# 使用技術 (バックエンド)
Ruby (2.7.7) - 開発言語

Ruby on Rails(6.0.6.1.) - Webアプリケーションフレームワーク

postgleSQL (14.9) - RDB

Redis (6.0.10) - キャッシュ、セッションストア

Mailgun - メール送受信

RSpec (5.1.2) - テスト

Rubocop()- コード管理


# 使用技術 (その他)
Docker - コンテナ管理

AWS S3 - ストレージ

Heroku - デプロイ

# 今後取り入れたい技術
GitHub Actions - CI/CD

AWS ECS -

React -



# 機能一覧
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
