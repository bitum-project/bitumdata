module github.com/bitum-project/bitumdata

require (
	github.com/caarlos0/env v3.5.0+incompatible
	github.com/chappjc/logrus-prefix v0.0.0-20180227015900-3a1d64819adb
	github.com/decred/slog v1.0.0
	github.com/dgryski/go-farm v0.0.0-20190416075124-e1214b5e05dc // indirect
	github.com/didip/tollbooth v4.0.1-0.20180415195142-b10a036da5f0+incompatible
	github.com/didip/tollbooth_chi v0.0.0-20170928041846-6ab5f3083f3d
	github.com/dmigwi/go-piparser/proposals v0.0.0-20190426030541-8412e0f44f55
	github.com/dustin/go-humanize v1.0.0
	github.com/go-chi/chi v4.0.3-0.20190316151245-d08916613452+incompatible
	github.com/google/gops v0.3.6
	github.com/googollee/go-engine.io v0.0.0-20180829091931-e2f255711dcb // indirect
	github.com/googollee/go-socket.io v0.0.0-20181214084611-0ad7206c347a
	github.com/jessevdk/go-flags v1.4.0
	github.com/jrick/logrotate v1.0.0
	github.com/konsorten/go-windows-terminal-sequences v1.0.2 // indirect
	github.com/mattn/go-colorable v0.1.1 // indirect
	github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b // indirect
	github.com/patrickmn/go-cache v2.1.0+incompatible // indirect
	github.com/rs/cors v1.6.0
	github.com/shiena/ansicolor v0.0.0-20151119151921-a422bbe96644
	github.com/sirupsen/logrus v1.2.0
	github.com/smartystreets/goconvey v0.0.0-20190330032615-68dc04aab96a // indirect
	github.com/x-cray/logrus-prefixed-formatter v0.5.2 // indirect
	golang.org/x/net v0.0.0-20190613194153-d28f0bde5980
	golang.org/x/time v0.0.0-20190308202827-9d24e82272b4 // indirect
)

replace (
	github.com/bitum-project/bitumdata/api/types => ./api/types
	github.com/bitum-project/bitumdata/blockdata => ./blockdata
	github.com/bitum-project/bitumdata/db/cache => ./db/cache
	github.com/bitum-project/bitumdata/db/dbtypes => ./db/dbtypes
	github.com/bitum-project/bitumdata/db/bitumpg => ./db/bitumpg
	github.com/bitum-project/bitumdata/db/bitumrates => ./bitumrates
	github.com/bitum-project/bitumdata/db/bitumsqlite => ./db/bitumsqlite
	github.com/bitum-project/bitumdata/exchanges => ./exchanges
	github.com/bitum-project/bitumdata/explorer/types => ./explorer/types
	github.com/bitum-project/bitumdata/gov => ./gov
	github.com/bitum-project/bitumdata/mempool => ./mempool
	github.com/bitum-project/bitumdata/middleware => ./middleware
	github.com/bitum-project/bitumdata/pubsub/types => ./pubsub/types
	github.com/bitum-project/bitumdata/pubsub => ./pubsub
	github.com/bitum-project/bitumdata/rpcutils => ./rpcutils
	github.com/bitum-project/bitumdata/semver => ./semver
	github.com/bitum-project/bitumdata/stakedb => ./stakedb
	github.com/bitum-project/bitumdata/testutil/dbconfig => ./testutil/dbconfig
	github.com/bitum-project/bitumdata/txhelpers => ./txhelpers
)
