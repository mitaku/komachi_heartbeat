# KomachiHeartbeat

## About
Rails アプリケーションとDBサーバーの死活監視するためのURLを提供するEngine

### 死活監視
`/MOUNT_PATH/heartbeat`

アプリケーションの状態に問題がなければ200 OKを返す

#### チェック可能項目
- Web
- DB
- Redis
- Memcached

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
### Parameters
- `application_version`
- `application_name`
- `db_check_enabled`
 - DBのチェックを行うかどうか
 - default: true
- `database_class_names`
 - DBのチェックに利用するクラス名の配列
 - default: ["ActiveRecord::Base"]
- `redis_check_enabled`
 - Redisをチェックするかどうか
 - default: false
- `redis_servers`
 - Redisのサーバー情報
 - default: [{host: "localhost", port: 6379, db: 0}]
- `memcached_check_enabled`
 - Memcachedをチェックするかどうか
 - default: false
- `memcached_server_names`
 - Memcachedのサーバー名の配列
 - default: ['localhost']

### Example

```
Rails.application.config.heartbeat.application_name = "YOUR APP NAME"
Rails.application.config.heartbeat.application_version = "YOUR APP version"
```

see https://github.com/mitaku/komachi_heartbeat/blob/master/spec/dummy/config/application.rb

This project rocks and uses MIT-LICENSE.
