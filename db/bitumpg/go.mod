module github.com/bitum-project/bitumdata/db/bitumpg

go 1.11

require (
	github.com/chappjc/trylock v1.0.0
	github.com/davecgh/go-spew v1.1.1
	github.com/decred/slog v1.0.0
	github.com/dmigwi/go-piparser/proposals v0.0.0-20190426030541-8412e0f44f55
	github.com/dustin/go-humanize v1.0.0
	github.com/lib/pq v1.1.0
)

replace (
	github.com/bitum-project/bitumdata/api/types => ../../api/types
	github.com/bitum-project/bitumdata/db/cache => ../cache
)
