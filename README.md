# findbook

## サイト概要
### サイトテーマ
利用者が読みたい本をジャンルや読了目安時間から検索でき、実際にどうだったかを評価できるサイト（レビューサイト）

### テーマを選んだ理由
自身が読書したい時は何が読みたいのか決まっておらず、「こんなジャンルの本が読みたい」という漠然とした思いから読みたい本を探す事が多い。
その際に今の気分に合ったものを見つけられない事も多々ある。
また、短編か長編かで迷う事もあり、「じっくり時間をかけてサスペンスを楽しみたい」など、
ジャンルと読了時間のどちらの条件も満たした１冊というのは中々簡単には見つけることができない。
レビューサイトで検索し、他の利用者の評価を見てみることができれば今自分が望んでいる本に出会いやすくなるのではと思い、このサイトを作成したいと考えた。

### ターゲットユーザ
- 読書したいが何を読むか決まっていないユーザ
- 気になっている本について他者の意見を参考にしたいユーザ
- 自身が読んだ本を記録しておきたいユーザ
- ジャンルごとに絞り込み検索をして目的の本を見つけたいユーザ
- 自身の空き時間に応じて読める本を探したいユーザ

### 主な利用シーン
- 読書をする時
- 読みたいジャンルは決まっていても、目的の本が無い時
- 時間に合わせて読む本を見つけたい時（長編か短編かなど）
- 読みたいと考えている本について、その本のレビューを見たい時
- 以前自身が読んだ本がどんなものだったか確認したい時

## 設計書
機能実装リストURL https://docs.google.com/spreadsheets/d/1soiBq-Xj4MlaBzp1Jr76XRXyBy9Lth4FWUwoQQyTQ_c/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
楽天APIを使用し書籍の情報を取得、表示

## 規約
楽天APIを導入し書籍画像を掲載する