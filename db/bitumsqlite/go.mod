module github.com/bitum-project/bitumdata/db/bitumsqlite

go 1.12

replace github.com/bitum-project/bitumdata/stakedb => ../../stakedb

require (
	github.com/boltdb/bolt v1.3.1 // indirect
	github.com/decred/slog v1.0.0
	github.com/dustin/go-humanize v1.0.0
	github.com/google/go-cmp v0.2.0
	github.com/mattn/go-sqlite3 v1.10.0
)

replace (
	github.com/bitum-project/bitumdata/db/cache => ../cache
	github.com/bitum-project/bitumdata/testutil/dbconfig => ../../testutil/dbconfig
)
