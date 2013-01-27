# KomachiHeartbeat

## About
Rails アプリケーションとDBサーバーの死活監視するためのURLを提供するEngine

### 死活監視
`/MOUNT_PATH/heartbeat`

schema_migrationsテーブルへのクエリを発行する
問題がなければ200 OKを返す

### バージョン確認
`/MOUNT_PATH/version`

アプリ名・バージョンを取得する

## Usage

1. write Gemfile
  `gem "komachi_heartbeat"`
1. `bundle install`
1. write config/routes.rb
  `mount KomachiHeartbeat::Engine => "/ops"`

## Configure
```
Rails.application.config.komachi_heartbeat.application_name = "YOUR APP NAME"
Rails.application.config.komachi_heartbeat.application_version = "YOUR APP version"
```

This project rocks and uses MIT-LICENSE.
