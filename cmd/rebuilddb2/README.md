# Command line app `rebuilddb2`

The `rebuilddb2` app is used for maintenance of bitumdata's `bitumpg` database that
uses PostgreSQL to store a nearly complete record of the Bitum blockchain data.

**IMPORTANT**: When performing a bulk data import (e.g. full chain scan from
genesis block), be sure to configure PostgreSQL appropriately.  Please see
[postgresql-tuning.conf](../../db/bitumpg/postgresql-tuning.conf) for tips.

## Installation

Be able to build bitumdata (see [../../README.md](../../README.md#build-from-source)). In short:

* Install `dep`, the dependency management tool

      go get -u -v github.com/golang/dep/cmd/dep

* Clone the bitumdata repository

      git clone https://github.com/bitum-project/bitumdata $GOPATH/src/github.com/bitum-project/bitumdata

* Populate vendor folder with `dep ensure`

      cd $GOPATH/src/github.com/bitum-project/bitumdata
      dep ensure

* Build `rebuilddb2`

      # build rebuilddb2 executable in workspace:
      cd $GOPATH/src/github.com/bitum-project/bitumdata/cmd/rebuilddb2
      go build
      # or to install bitumdata and other tools into $GOPATH/bin:
      go install ./cmd/rebuilddb2

## Usage

First edit rebuilddb2.conf, using sample-rebuilddb2.conf to start.  You will
need to follow a typical PostgreSQL setup process, creating a new
database/scheme and a new role that has permissions/owns that database.

A fresh rebuild of the database is accomplished via:

```
./rebuilddb2 -D  # drop any existing tables
./rebuilddb2     # rebuild tables from scratch
```

Remember to update your PostgreSQL config (postgresql.conf) before *and after*
bulk data imports. Namely, before normal bitumdata operation, ensure that
`fsync=true` and other setting are adjusted for efficient queries.

## Details

Rebuilding the bitumdata tables from scratch involves the following steps:

* Connect to the PostgreSQL database using the settings in rebuilddb2.conf
* Create the tables (i.e. "blocks", "transactions", "vins", etc).
* Starting from genesis block, process each block and store in tables.
* Create indexes for each table.

See `rebuilddb2 --help` for more information on how to tweak the operating mode.

## License

See [LICENSE](../../LICENSE) at the base of the bitumdata repository.
