// Copyright (c) 2019, The Bitum developers
// See LICENSE for details.

package bitumrates

import "github.com/bitum-project/bitumd/bitumutil"

const (
	DefaultKeyName  = "rpc.key"
	DefaultCertName = "rpc.cert"
)

var (
	DefaultAppDirectory = bitumutil.AppDataDir("bitumrates", false)
)
