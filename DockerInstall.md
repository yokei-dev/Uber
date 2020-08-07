# Docker環境構築手順

## Docker for Mac のインストール

1. 公式サイトからダウンロードしてインストールする

    https://www.docker.com/

    ※Homebrew でインストールすす方法もあるので、やってみたい方はそちらも可

2. 以下のコマンドを実行してバージョン情報が表示されたらOK

    ```
   $ docker version
    ```

## 設定ファイルの移行

1. 新たにRailsアプリケーションを作成する場合

   自PC環境のコマンドバージョンを確認してください
   
        - ruby のバージョンが `>=2.7.x`
        - bundler のバージョンが `>=2.1.x`

   渡されたフォルダ名を任意のアプリケーション名に書き換えて、environmentフォルダ配下に配置してください   

2. 既にRailsプリケーションを作成済みの場合

   既に作成中のアプリケーションの中に、以下のファイルを配置してください
   
        - docker-compose.yml
        - Dockerfile
        - entrypoint.sh
        - Gemfile   (*)

   (*) 既に追加インストール済みのモジュールがある場合は、上手にマージしてください
   
3. 以下のコマンドを実行して環境を構築してください

   ```
   $ bundle install
   ```
   エラーが発生する場合は、以下も試してみてください
   ```
   $ bundle update
   ```

   コマンドが無事完了するはずです

## Docker環境の起動

1. 以下のコマンドを実行してDocker環境を起動してください

   ```
   $ docker-compose up -d
   ```
   
   問題がなければ、最後に以下のように表示されます
   
   ```
   Starting teach-ruby_db_1 ... done
   Starting teach-ruby_web_1 ... done
   ```

2. アクセスできることを確認します

   - ブラウザで以下にアクセスしてみてください

   ```
   http://localhost:3000/
   ```

   - Mysqlにアクセスしてみてください
   
   ```
   mysql -u root -h localhost
   ```

3. 環境を停止するときは以下のコマンドを実行してください

   ```
   $ docker-compose stop
   ```
