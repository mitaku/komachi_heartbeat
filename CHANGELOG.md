# KomachiHeartbeat

## Master

## v2.5.0
- `/stats/worker`に`sidekiq`の情報を追加 (#23 _@kawakubox_)
 - sample: `{processed: 114781, failed: 61659, scheduled_size: 0, retry_size: 0, dead_size: 0, processes_size: 0, default_queue_latency: 0, workers_size: 0, enqueued: 24}`
- CIサポート ruby2.4, rails5.1 (#21,#22 _@sue445_)

## v2.4.0
- DBの疎通チェックのSQLを修正 (#20 _@takanamito_)
 - 元々の目的としてDBへの接続が取れることを確認するための処理だったが`schema_migrations`が作成されないケースなどの対応のためにテーブルのチェックではなくDBへの疎通を確認する処理に変更


## v2.3.1
- デフォルトのフォーマットを`txt`に指定 (#19 _@sue445_)

## v2.3.0
- Rails5のduplication warning対応
- Railsのサポートバージョンを4.1以上にする

## v2.2.0
- document修正 (#12 _@shishi_)
- Postgresqlでも動作するようにMySQL-style backticksの削除 (#9 _@askelof_)

## v2.1.9
- REVISIONをAPIで返せるように機能追加 (#9 _@onk_)

## v2.1.8
- support [Dalli](https://github.com/mperham/dalli) (#8 _@askelof_)

## v2.1.7
- remove unnecessary assets (#7 _@tkeo_)
- support travis (#5 _@sue445_)
- update readme (#4 #6 _@sue445_)

## v2.1.4
- MemCachedのコネクションを明示的に切るように修正 (#1 _@gussan_)

## v2.1.3
- Redisのコネクションを明示的に切るように修正

## v2.1.2
- heartbeat成功時のメッセージの修正

## v2.1.0
- 複数のサーバーの監視
 - Redis
 - Memcached

## v2.0.0
- Redisの監視に対応
- Memcachedの監視に対応
- 複数のDBの監視に対応

## v1.0.0
- release!
