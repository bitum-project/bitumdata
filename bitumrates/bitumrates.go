// Copyright (c) 2019, The Bitum developers
// See LICENSE for details.

package bitumrates

import "github.com/bitum-project/bitumd/bitumutil"

// Default TLS configuration.
const (
	DefaultKeyName  = "rpc.key"
	DefaultCertName = "rpc.cert"
)

var (
	// DefaultAppDirectory is the default location of the bitumrates application
	// data folder.
	DefaultAppDirectory = bitumutil.AppDataDir("bitumrates", false)
)
