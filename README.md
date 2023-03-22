# サービス名： Round Planner

[![Image from Gyazo](https://i.gyazo.com/7d5266b856cb0f732f0db29d68ea45d9.jpg)](https://gyazo.com/7d5266b856cb0f732f0db29d68ea45d9)

# [Round Planner](http://www.round-planner.com)

## ■ サービス概要
海外周遊旅行を考えているバックパッカーや旅行者の
計画立案や入国時の必要情報を提供するサービス
## ■メインのターゲットユーザー
- バックパッカー

- Round Tripを考えている方

## ■ユーザーが抱える課題
- 行きたい国をリストアップしてから、国ごとにビザ等の入国情報を手に入れてくるのが大変。

- 入国情報には、ビザの有無、入国制限の有無、国家間の関係性の情報がある。

## ■解決方法
旅行計画と計画した国の必要な情報を提供するサービスをつくる。

- 行きたい国をピックアップして、旅行計画を立てる。

- 国ごとに、ビザや入国時に必要な情報を提供する


## ■制作した背景
私が、海外旅行が好きで、何カ国を周るような旅行を計画します。その中で、一番重要な情報はビザや入国などの情報です。

外務省が発表している情報が最も正しいのですが、個人で計画をたてると抜け漏れが多くなります。

 →特にビザやワクチンの情報が抜けると、入国不可になることもあり得る。

楽しく安全な旅行にするためにも、情報を提供できるサービスがあれば良いと思いました。

## 機能の紹介

| トップページ                                                          | プラン作成                                                          |
| ------------------------------------------------------------------ | -------------------------------------------------------------------- |
| [![Image from Gyazo](https://i.gyazo.com/460d048af34ef22b107fde2c479b5b34.jpg)](https://gyazo.com/460d048af34ef22b107fde2c479b5b34) | [![Image from Gyazo](https://i.gyazo.com/f9e5d7fa6368debb7573c6ddae5a2caa.jpg)](https://gyazo.com/f9e5d7fa6368debb7573c6ddae5a2caa)  |
| ・トップページ              | ・プランの作成<br> ・行きたい国の登録                           |

| 安全情報詳細                                                                       | プロフィール                                                         |
| ------------------------------------------------------------------                | -------------------------------------------------------------------- |
|[![Image from Gyazo](https://i.gyazo.com/6d52f2957b599827ba5dcdc5c5d4b4da.jpg)](https://gyazo.com/6d52f2957b599827ba5dcdc5c5d4b4da) | [![Image from Gyazo](https://i.gyazo.com/2b1a29a8c95532f0cc385af862517c88.jpg)](https://gyazo.com/2b1a29a8c95532f0cc385af862517c88) |
| ・リストアップ国をマーカー表示<br>・クリックすると情報の表示、外務省へのリンク | ・プロフィールの表示<br>・計画一覧の表示          |

## ■実装予定の機能
### MVPリリース

- ユーザー登録機能

- ログイン・ログアウト機能

- ゲストログイン機能

- メイン機能(計画中ユーザー)

  - 計画作成、一覧、詳細、編集機能

  - 安全情報の閲覧機能

- CRUD機能(旅行中ユーザー、他ユーザー)

  - 他ユーザーの計画詳細を閲覧可能

### 本リリース(予定)

  - topページ画像のスライダー機能

  - 規約関連のページ作成

  - 表示類の日本語化

  - OGPの設定

  - google analytics  search consoleの導入

  - アプリの使い方ページを作成

  - 画像保存

  - メイン機能

    - 安全情報の整理(simple_formatなどでの、段落にする)

- プロフィール機能

  - ユーザーの詳細を閲覧、編集

  - 計画中の国をリストアップ

  - 旅行計画を閲覧できる

  - 自分の計画の詳細を閲覧できる(詳細)


### ■画面遷移図
[figma](https://www.figma.com/file/Bqv2jm6XStVIqhG6oithXs/Round-Planner?t=LDsPw9EsTTORywpQ-6)

### ■ER図
[![Image from Gyazo](https://i.gyazo.com/1c5329700081d196b97d55dc4bd664df.png)](https://gyazo.com/1c5329700081d196b97d55dc4bd664df)
### ■スケジュール
  企画〜技術調査：2/4 〆切

  README〜ER図作成：2/8 〆切

  メイン機能実装：2/9 - 3/10

  β版をRUNTEQ内リリース（MVP）：3/11〆切

  本番リリース：3月末

## 使用技術

#### バックエンド

- Ruby 3.1.2
- Rails 7.0.4

#### 主要ライブラリ

- Sorcery
- Seed
- geocoder
- gon
- cocoon
- meta_tags
- nokogiri

#### フロントエンド

- HTML/SCSS/JavaScript
- CSSフレームワーク
  - Tailwind CSS
  - daisyUI
  
#### インフラ

- Heroku
- PostgreSQL

#### その他

- Google Map Javascript API（施設データ取得）
- 外務省 海外安全情報オープンデータ

#### ツール

- Googleアナリティクス (GA4)
- Googleサーチコンソール


