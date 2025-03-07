# プロジェクト名： Morning Hub
<img width="700" src="app/assets/images/top_image.webp">

# 目次
- [サービス概要](#-サービス概要)
- [サービスURL](#-サービスurl)
- [サービス開発の背景](#-サービス開発の背景)
- [機能紹介](#-機能紹介)
- [技術構成](#-技術構成)
  - [使用技術](#使用技術)
  - [ER図](#er図)
  - [画面遷移図](#画面遷移図)


# 🌅 サービス概要
--朝から始まる、理想のワークスペースを見つけよう！--<br>
<br>
「Morning Hub」は、朝に利用できるカフェやコワーキングスペース、公園などを簡単に検索できるサービスです。Wi-Fiやコンセントの有無など、作業環境に特化した情報を提供し、ユーザーが最適なスポットを見つける手助けをします。多様な利用シーンに対応したカフェやスペースの実態を把握できるプラットフォームです。<br>
<br>

# 🖥️ サービスURL
### **https://www.morning-hub.com**<br>
<br>

# 💁🏻‍♂️ サービス開発の背景
私自身、朝の時間にカフェでPC作業や読書をするのが好きです。しかし、どのカフェが快適な作業環境を提供しているかは分かりにくいと感じました。この経験から、同じようなニーズを持つ人々が自分に合った場所を簡単に見つけられるアプリを作りたいと思いました。また、環境に対する情報を集めることで、より快適な時間を過ごす手助けができればと考えています。<br>
<br>

# 💡 機能紹介
<table>
  <tr>
    <th colspan="2"><div align="center" valign="middle">ユーザー登録、ログイン機能</div></th>
  </tr>
  <tr align="center">
    <td><a href="https://gyazo.com/c1d0f3977b4900fe58259a657fb82ae8"><img src="https://i.gyazo.com/c1d0f3977b4900fe58259a657fb82ae8.png" alt="Image from Gyazo" width="650"/></a></td>
    <td><a href="https://gyazo.com/4851e2a7ec5107f81e570882165a13d4" ><img src="https://i.gyazo.com/4851e2a7ec5107f81e570882165a13d4.png" alt="Image from Gyazo" width="650"/></a></td>
  </tr>
  <tr>
    <td colspan="2">『名前』『メールアドレス』『パスワード』『確認用パスワード』を入力してユーザー登録を行います。ユーザー登録後は、自動的にログイン処理が行われるようになっており、そのまま直ぐにサービスを利用する事が出来ます。また、Googleアカウントを用いてGoogleログインを行う事も可能です。</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="2"><div align="center" valign="middle">スポットの詳細</div></th>
  </tr>
  <tr align="center">
    <td><a href="https://gyazo.com/46827c66285aa5120f94f6e3e1fa7b01"><img src="https://i.gyazo.com/46827c66285aa5120f94f6e3e1fa7b01.png" alt="Image from Gyazo" width="686"/></a></td>
  </tr>
  <tr>
    <td colspan="2">スポット画面では各情報、マップ、そのスポットを利用したユーザーがどの目的で使用したかをグラフで確認することができます。また、他のユーザーが登録したスポットをお気に入り登録することもできます。</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="2"><div align="center" valign="middle">スポットの登録機能</div></th>
  </tr>
  <tr align="center">
    <td><a href="https://gyazo.com/149a96fa073d7b5fb2045482a89ed4a7"><img src="https://i.gyazo.com/149a96fa073d7b5fb2045482a89ed4a7.png" alt="Image from Gyazo" width="823"/></a></td>
  </tr>
  <tr>
    <td colspan="2">ユーザー登録後には、自分が朝活をしているスポットを登録することができます。『店名』『カテゴリ』『住所』『説明』『タグ』『画像』を登録することができます。自分で登録したスポットはあとで情報を変更することができます。</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="2"><div align="center" valign="middle">スポットのレビュー機能</div></th>
  </tr>
  <tr align="center">
    <td><a href="https://gyazo.com/b1547425bd822ba8f4a03a8d83491fdb"><img src="https://i.gyazo.com/b1547425bd822ba8f4a03a8d83491fdb.png" alt="Image from Gyazo" width="1399"/></a></td>
    </tr>
    <tr>
    <td align="center"><a href="https://gyazo.com/f961a16e36c04c4031d24664428a8519"><img src="https://i.gyazo.com/f961a16e36c04c4031d24664428a8519.png" alt="Image from Gyazo" width="800"/></a></td>
  </tr>
  <tr>
    <td colspan="2">ユーザー登録後には、自分が朝活をしたスポットに対してコメントすることができます。『利用シーン』『利用時間』『おすすめ度』『タイトル』『本文』が登録できます。スポットの詳細だけではなく、自分の朝活の記録としてもご利用いただけます。</td>
  </tr>
</table>

<table>
  <tr>
    <th colspan="2"><div align="center" valign="middle">スポットのマルチ検索機能</div></th>
  </tr>
  <tr align="center">
    <td><a href="https://gyazo.com/e233dd961ac521c10e8d87e2a2529e06"><img src="https://i.gyazo.com/e233dd961ac521c10e8d87e2a2529e06.png" alt="Image from Gyazo" width="1201"/></a></td>
  </tr>
  <tr>
    <td colspan="2">スポット一覧画面の検索フォームから『店名』『カテゴリ』『住所』『タグ』により、スポットの検索を行えます。『店名』は入力することで合致する候補を表示します。また、タグをクリックすることで同じタグがついているスポットを一覧で表示します。</td>
  </tr>
</table>
<br>

# 🛠️ 技術構成
## 使用技術
| カテゴリ     | 使用技術      |
|:-----------:|:------------|
|フロントエンド | Rails 7.2.2 / Bootstrap / Javascript |
| バックエンド  | Rails 7.2.2(ruby 3.2.3) |
| インフラ     | heroku / AmazonS3 |
| DB          | MySQL |
| 開発環境     | Docker |
| CI/CD       | GitHub Actions |<br>

## ER図
[![Image from Gyazo](https://i.gyazo.com/f585ea4afa8a4fc06571765198908f1c.png)](https://gyazo.com/f585ea4afa8a4fc06571765198908f1c)<br>
<br>

## 画面遷移図
### **[リンク](https://www.figma.com/design/9dvLdwNSajYc9R4UmZ9Eru/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&m=dev&t=b7ho7k2A9POwip3G-1)**<br>
<br>
