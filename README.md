# README

# tsunagaru.jp
tsunagaru.jpは、ツイッターアカウント同士をイベントでつなげるマッチングアプリケーション

# URL
未定

# DEMO
未定

# 機能一覧
・ツイッターアカウントによるユーザー登録・マイページ・ログイン機能  
・イベント作成・編集・削除機能  
・イベント検索・ソート・Twitterシェア・お気に入り機能  

# 課題解決
・ツイッター内コミュニティにおける、マッチング促進  

# 開発環境
・Haml  
・SCSS  
・Ruby  
・Ruby on Rails  
・javascript  
・Jquery   
・GitHub  
・Mysql  
・AWS  

# USAGE
1:Twitterアカウントでサインアップ及びログイン  
2:ヘッダーメニューより「イベントを作る」を選択後、必須項目を入力し、イベントを登録  
3:トップページ、「イベントを見る」より新着、もしくは開催日時順に閲覧可能  
4:イベント詳細より、イベント作成者のTwitterアカウントへのアクセス可能  
5:レスポンシブ対応のため、スマホ閲覧時にはフッターやハンバーガーメニューに各種格納  
6:無限スクロール仕様の為、大量のデータに対し、ページ遷移は不要  

# ローカル動作方法

## バージョン

Ruby 2.6.5  
Ruby on Rails 6.0.3.2  

## 動作までのコマンド
git clone 
bundle install  
yarn install  
rails db:create  
rails db:migrate  
rails s  

# 追加実装要件
・イベントへのコメント機能