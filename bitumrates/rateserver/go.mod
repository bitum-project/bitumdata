module github.com/bitum-project/bitumdata/bitumrates/rateserver

replace (
	github.com/bitum-project/bitumdata/bitumrates => ../
	github.com/bitum-project/bitumdata/exchanges => ../../exchanges
)

require (
	github.com/decred/slog v1.0.0
	github.com/jessevdk/go-flags v1.4.0
	github.com/jrick/logrotate v1.0.0
	google.golang.org/grpc v1.20.0
)
