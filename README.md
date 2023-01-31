＃サービス名： Traveller's Galley(仮)
### ■ サービス概要
  旅行に出たい！！ 旅という非日常な時間をシェアしたい！ 思い出を振り返りたい！
  そんな方へ、旅という最高な時間を共有するサービスです

### ■メインのターゲットユーザー
  旅行好きな人。興味ある人
  自分の思い出を共有したい方

### ■ユーザーが抱える課題
  旅行で発生した様々なエピソードを共有したい。思い出を残したい。
  移動の自由がまだ制限されている中で、旅行の楽しさを振り返りたい。

### ■解決方法
  撮った写真の中から、好きな写真とともに振り返りたいエピソードを1作品として共有する。
  作品をまとめて、ギャラリーとして展示することで、たくさんの旅行と思い出を振り返ることができる。
  
### ■実装予定の機能(仮)
  未ログインユーザー
    ユーザー登録機能
    ログイン
    CRUD機能
      - 作品を作成できる
      - 一覧を閲覧できる。条件付きとするかもしれません(仮)
      - 作品の詳細を見ることができる。
    いいね機能

  ログインユーザー
    ログアウト機能
    パスワードリセット機能
    退会機能
    CRUD機能(作成、一覧、編集、削除、詳細)
      - 作品を作成できる。(未ログイン可)
      - 一覧を閲覧できる。(未ログイン一部可)
      - 作品の編集・削除ができる
      - 作品の詳細を見ることができる。
      **google map API使用 クリッカブルマップ？使用(予定)**
       - 一覧機能で地域別から閲覧できるようするため。
    プロフィール機能
     - ユーザーの詳細がわかる。
     - ユーザーの作品を一覧表示できる
    検索機能
     -地域、タグ検索機能を予定(仮)
    コメント機能
    ブックマーク機能
    Twitterへの投稿共有機能
    Line共有機能

### ■なぜこのサービスを作りたいのか？
  旅行には、たくさんの思い出が詰まっていると思います。楽しかったこと、大変だったこと、珍事件 etc.
  そんなたくさんの思い出が詰まっている旅行を振り返る1作品として、また共有できたら面白いなと思いました。

### ■スケジュール
  企画〜技術調査：2/4 〆切
  README〜ER図作成：2/8 〆切
  メイン機能実装：2/9 - 3/10
  β版をRUNTEQ内リリース（MVP）：3/11〆切
  本番リリース：3月末