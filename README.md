# アプリケーション名
### Sunflower-Garden

# アプリケーション概要
園芸は非常に多くの人の趣味として、昔から楽しまれているが、植物であるが故に管理の難しさや奥の深さがある。
園芸の難しさを乗り越え、より楽しむことができるように、SNS機能やスケジュール管理、日記機能を実装したアプリである。

# URL
https://sunflower-garden.jp/

# テスト用アカウント
メールアドレス : hanako@test.com
パスワード : h111111

# 利用方法
TOPページ
![Image from top-page-image](https://github.com/katsuya53/sunflower-garden53/blob/main/app/assets/images/TOP-page.png?raw=true)

## 操作ガイド
https://sunflower-garden.jp/guide/index

## ユーザー登録、編集、削除
1. TOPページの新規登録をクリックして必要な情報を登録すると、認証メールが届くので、クリックすると登録が完了する
2. メールアドレスとパスワードでログインが可能となる。
3. ユーザー情報の変更や削除はメニュー上部のニックネームやアバターをクリックして編集画面から行う

## ログイン、ログアウト
1. TOPページに閲覧者の状態によってログインとログアウトが表示されている
2. ログインしていなくて閲覧は可能だが、ほとんどのメニューは利用できない

## メニュー
1. TOPページのメニューは画面の幅によって表示が変わる
2. スマホなど幅が770以下の画面では右上三本線のMENUボタンを押すことでメニューの表示と非表示を選択できる

## 新規投稿
1. 新規投稿ボタンをクリックすると新規投稿フォームが表示される
2. 画像、タイトル、文章、タグを投稿する
3. TOPページに表示される

## 投稿編集、コメント
1. 投稿画像をクリックすると、詳細ページが表示され、投稿者の投稿であれば編集と削除ができる
2. ログインしていれば、コメントを入力してコメントするボタンをクリックするとその投稿にコメントができる
3. 詳細ページでは投稿者であればコメントを編集、削除ができる

## いいね機能
1. TOPページや投稿詳細ページでいいねボタンを押すと赤色に画像が変わりカウントが増える
2. いいねを解除するには再度いいねボタンを押す

## ユーザー詳細、編集、フォロー
1. サイドバーのメニューにあるログイン中のユーザー名をクリックするとユーザー詳細ページが表示される
2. 投稿詳細ページで投稿者のニックネームをクリックしてもそのユーザー詳細ページが表示される
3. ログイン中のユーザーであればユーザーの登録情報を編集できる
4. 「フォローする」をクリックすると閲覧しているユーザーをフォローをしたり、解除ができる

## 検索
1. TOPページの検索フォームには、投稿者、投稿タイトル、投稿文、タグといったキーワードで検索できる
2. 検索結果は一覧で表示される

## カレンダー
1. ログイン中であればメニューのカレンダーをクリックするとそのユーザーだけのカレンダーが表示される
2. 日時、タイトル、内容を入力して予定を作成でき、設定した時刻に登録されているアドレスにメールが届く
3. 「メール通知しない」にチェックすれば通知されない
4. メールが着信する前であれば、予定の編集をすればメールの配信日時も再設定できる

## 写真日記
1. ログイン中であればメニューの写真日記をクリックするとそのユーザーだけの日記が表示される
2. 日時、写真、文章、カテゴリーを入力して投稿ができ、日時は過去未来自由に編集が可能
3. カテゴリーは新しく作成することができる
4. カテゴリー別に日記を古いもの順に表示することができる

## 情報取得機能「何の花？」
1. メニュー「何の花？」をクリックすると今日の花のページが表示される
2. 閲覧日の誕生花が表示され、もっと情報が知りたい場合は「詳しく調べる」リンクをクリックするとgoogle検索ページが表示される
3. 閲覧日以外にも翌日や７日前までの花も調べることができる

## 情報取得機能「今日の天気」
1. メニュー「今日の天気」をクリックするとそのユーザーの都道府県の気象情報ページが表示される
2. 更新ボタンを押すとリアルタイムに気象情報が更新される

## お問い合わせ
1. フォームに入力した質問や不具合の報告などが、管理者へメール送信される

# アプリケーションを作成した背景
植物の管理の難しさの解決し、成長の記録ができ、他者との共有や交流ができるサイトがあればと考えた。
園芸を楽しみたい世代としては50歳以降に多いが、既存アプリではコンテンツ内容が細かく見づらかったり、わかりづらい。
そこで、やりがいのあるこの趣味をもっと楽しめるものにするためのコンテンツを独自に作成したくて、このアプリを制作した。

# 洗い出した要件
要件定義シート_SUNFLOWER-GARDEN
https://docs.google.com/spreadsheets/d/1gckdPCufE7ylFW7s5P7IHMctCwj01BmyZb0qN4f2qoQ/edit#gid=982722306

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/3f9222bf8aaa542044b3667bca8daebb.png)](https://gyazo.com/3f9222bf8aaa542044b3667bca8daebb)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/632d8dcf83a5e423037fa596ad84c899.png)](https://gyazo.com/632d8dcf83a5e423037fa596ad84c899)

# 開発環境
- フロントエンド：HTML,CSS,javascript,Ruby 3.2.0（Ruby on Rails 7.0.8.1）
- バックエンド：Ruby on Rails 7.0.8.1
- インフラ：Amazon AWS
- タスク管理：スプレッドシート

# テスト
- Rspec 単体テスト(model)

# ローカルでの動作方法
以下のコマンドを順に実行。  
% git clone https://github.com/katsuya53/sunflower-garden53  
% cd sunflower-garden53  
% bundle install

# 工夫したポイント
1. あくまで主役は花なので、サイトのデザインはシンプルに、可愛らしく制作。デザインは他サイトを参考にせずあくまで完全オリジナル
2. 見た目が崩れないように投稿やコメント、タグの文字数など、レスポンシブデザインとしてPCやスマホへの対応を調整
3. 多機能。いいねやコメント数の表示、ユーザー認証、パスワードリセット、メールの通知機能、CSVインポートなどカリキュラムからより応用的な機能を実装
4. TOPページにログイン後や各種リンク後にメッセージを表示
5. 独自ドメイン取得、AWSでSSL化

# 改善点
- いいねボタンのクリック時に画面がスクロールされるので、画面を移動しないようにする
- 処理の加速化。初めて表示される場合は画像の表示がやや緩慢
- 天気の情報取得は3時間ごとの予報を表示されるようにする
- サーバー維持にコストがかかるのでより安価にするか、広告などでの維持費の為の収入が得られるようにする
- アバターの縦横比によって表示が不鮮明になるので切り取れて高画質のアイコンが作れるようにする
- コードが冗長で、可読性にもまだまだ課題がある
- どの世代にも使いやすいものになるようにご意見を収集して反映していく

# 制作時間①
- 制作期間：2024/3/5 ~ 5/10
- 製作時間：合計 約200時間

# 制作時間②
- 制作期間：2024/6/1 ~ 6/15
- 製作時間：合計 約30時間