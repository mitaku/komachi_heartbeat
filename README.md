# KomachiHeartbeat

## About
Rails アプリケーションとDBサーバーの死活監視するためのURLを提供するEngine
schema_migrationsテーブルへのクエリを発行する
問題がなければ200 OKを返す

## Usage

1. write Gemfile
  `gem "komachi_heartbeat"`
1. `bundle install`
1. write config/routes.rb
  `mount KomachiHeartbeat::Engine => "/ops"`

This project rocks and uses MIT-LICENSE.
