module github.com/bitum-project/bitumdata/pubsub/democlient

replace (
	github.com/bitum-project/bitumdata/api/types => ../../api/types
	github.com/bitum-project/bitumdata/blockdata => ../../blockdata
	github.com/bitum-project/bitumdata/db/cache => ../../db/cache
	github.com/bitum-project/bitumdata/db/dbtypes => ../../db/dbtypes
	github.com/bitum-project/bitumdata/db/bitumpg => ../../db/bitumpg
	github.com/bitum-project/bitumdata/db/bitumsqlite => ../../db/bitumsqlite
	github.com/bitum-project/bitumdata/bitumrates => ../../bitumrates
	github.com/bitum-project/bitumdata/exchanges => ../../exchanges
	github.com/bitum-project/bitumdata/explorer/types => ../../explorer/types
	github.com/bitum-project/bitumdata/gov/agendas => ../../gov/agendas
	github.com/bitum-project/bitumdata/gov/politeia => ../../gov/politeia
	github.com/bitum-project/bitumdata/mempool => ../../mempool
	github.com/bitum-project/bitumdata/middleware => ../../middleware
	github.com/bitum-project/bitumdata/pubsub => ../
	github.com/bitum-project/bitumdata/pubsub/types => ../types
	github.com/bitum-project/bitumdata/rpcutils => ../../rpcutils
	github.com/bitum-project/bitumdata/semver => ../../semver
	github.com/bitum-project/bitumdata/stakedb => ../../stakedb
	github.com/bitum-project/bitumdata/testutil/dbconfig => ../../testutil/dbconfig
	github.com/bitum-project/bitumdata/txhelpers => ../../txhelpers
)

require (
	github.com/google/go-cmp v0.3.0 // indirect
	github.com/jessevdk/go-flags v1.4.0
	github.com/kr/pty v1.1.4 // indirect
	golang.org/x/crypto v0.0.0-20190426145343-a29dc8fdc734 // indirect
	golang.org/x/net v0.0.0-20190502183928-7f726cade0ab
	golang.org/x/sys v0.0.0-20180926141714-2f1df4e56cde // indirect
	golang.org/x/text v0.3.2 // indirect
	google.golang.org/genproto v0.0.0-20190502173448-54afdca5d873 // indirect
	google.golang.org/grpc v1.20.1 // indirect
	gopkg.in/AlecAivazis/survey.v1 v1.8.2
)
