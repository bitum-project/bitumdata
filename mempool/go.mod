module github.com/bitum-project/bitumdata/mempool

go 1.11

replace (
	github.com/bitum-project/bitumdata/pubsub/types => ../pubsub/types
	github.com/bitum-project/bitumdata/txhelpers => ../txhelpers
)

require (
	github.com/decred/slog v1.0.0
	github.com/dustin/go-humanize v1.0.0
)
