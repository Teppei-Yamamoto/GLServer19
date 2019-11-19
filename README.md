# GLServer のインストール法

## 変更履歴
1. 19/10/16 初版の作成。projectとscrum_memberのみ実装を終了している。
1. 19/10/18 ubuntu でのネットワークの設定法と GLServer の起動法を追加。

## システム要件

Windows10 と ubuntu 18.04 LTS の両方の環境で sqlite3 データベースを用いて実行するため、ruby は 2.4 を使用する。

  - Windows10 または ubuntu 18.04 LTS
  - ruby    2.4
  - Rails   5.1.7
  - node.js v10.16.0
  - Bundler version 1.17.3
  - sqlite3 1.3.13

ubuntu 環境では、install-191015.pdf を参考にして rbenv を用いてインストールする。

Windows 環境では、[RubyInstallers](https://rubyinstaller.org/downloads/) より Ruby+Devkit 2.4.9-1 (x64) をダウンロードする。

## 1. bundler のアップデート

```bash
% ruby -v
ruby 2.4.6p354 (2019-04-01 revision 67394) [x64-mingw32]
% gem update --system
% gem install bundler -v 1.17.3
```

## 2. gem のインストール

bundle を実行する。puma は development, test 環境では不要。

```bash
% bundle install --without production
```

## 3. アプリケーションの準備p

データベースのスキーマやモデルが変わった場合は、以降を実行する。

```bash
% bundle exec rails db:drop:_unsafe
% bundle exec rake db:migrate RAILS_ENV=development
% bundle exec rake db:seed  RAILS_ENV=development
% bundle exec rake routes > routes.txt
```

## 4. GLServer を localhost で実行

次を実行すると、GLServer を localhost:3000 でアクセスできる。なお、Admin のメールアドレスとパスワードは example@railstutorial.org / foobar である。

```bash
% bundle exec rails s
```

## 5. GLServer を他のマシンからアクセスできるようにする

### 5.1 Windows10 の場合

DHCP を使用している場合は、次のページを参考にして、マシンの IP アドレスを設定する。設定が終わったら再起動する。

https://www.buffalo.jp/support/faq/detail/15257.html

他のマシンからアクセスできるようにするには、server.bat に書かれた <IP アドレス> と <ポート番号> を変更した後、次を実行する。

```bash
> server.bat
```

### 5.2 ubuntu の場合

#### IP アドレスを設定する

DHCP を使用している場合は、次のページを参考にして、マシンの IP アドレスを設定する。設定が終わったら再起動する。

https://linuxfan.info/ubuntu-1804-desktop-static-ip-address

次のページを参考にして、IP アドレスが重複していないことを確認する。

http://tech.clickyourstyle.com/articles/161


bundle を sudo で実行するために、次を実行する。

```text
% git clone https://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo
```

server.sh に書かれた <IP アドレス> と <ポート番号> を変更した後、次を実行する。

```bash
% bash server.sh
```

## 参考ページ

本システムで使用している gem について説明する。

### 1) bootstrap

Bootstrap4 については、次のサイトを参照する。

https://getbootstrap.jp/docs/4.3/

### 2) bootstrap_form

bootstrap_form を使うと、Bootstrap に対応したフォームを簡単に記述できる。ただし、細かい指定はできない。

https://github.com/bootstrap-ruby/bootstrap_form

bootstrap_form を使うと、次のようにフォームの記述が3分の１になる。
foobar
```erb
<%= bootstrap_form_for(@user) do |f| %>
  <%= f.email_field :email %>
  <%= f.password_field :password %>
  <%= f.check_box :remember_me %>
  <%= f.submit "Log In" %>
<% end %>
```

### 3) font-awesome

GLServer でアイコンフォントとして font awesome を使用している。使用できるアイコンは次のサイトで free のものを使用できる。search 窓にキーワードを入れてアイコンを検索する。

https://fontawesome.com/icons?d=gallery&m=free

例えば、plus アイコンを使用する場合は次のように記述する。

```erb
<%= icon("fas","plus") %>
```

### 4) record_tag_helper

Rails5 ではサポートされなくなった content_tag_for フォームヘルパーを利用できるようにするため、次の gem を使用している。

https://github.com/rails/record_tag_helper


以上




