// Copyright (c) 2019, The Bitum developers

package notification

import (
	"context"
	"sync"
	"testing"

	"github.com/bitum-project/bitumd/chaincfg/chainhash"
	"github.com/bitum-project/bitumd/bitumjson"
	"github.com/bitum-project/bitumd/wire"
	"github.com/bitum-project/bitumdata/txhelpers"
)

type dummyNode struct{}

func (node *dummyNode) NotifyBlocks() error              { return nil }
func (node *dummyNode) NotifyNewTransactions(bool) error { return nil }
func (node *dummyNode) NotifyWinningTickets() error      { return nil }

var counter int64
var hashTails = []string{"00", "01", "02", "03", "04", "05", "06", "07", "08", "09"}

func newHash() *chainhash.Hash {
	counter++
	h, _ := chainhash.NewHash([]byte("000000000000000000000000000000" + hashTails[int(counter)%len(hashTails)]))
	return h
}

func (node *dummyNode) GetBestBlock() (*chainhash.Hash, int64, error) {
	hash := newHash()
	return hash, counter, nil
}

var commonAncestorHash = newHash()
var commonAncestor = &wire.MsgBlock{
	Header: wire.BlockHeader{
		PrevBlock: *commonAncestorHash,
		Height:    uint32(5),
	},
}

// GetBlock will only be called by rpcutils.CommonAncestor, so it should return
// the same block every time.
func (node *dummyNode) GetBlock(blockHash *chainhash.Hash) (*wire.MsgBlock, error) {
	return commonAncestor, nil
}
func (node *dummyNode) GetBlockHash(blockHeight int64) (*chainhash.Hash, error) {
	hash := newHash()
	return hash, nil
}
func (node *dummyNode) GetBlockHeaderVerbose(hash *chainhash.Hash) (*bitumjson.GetBlockHeaderVerboseResult, error) {
	return nil, nil
}

var callCounter int = 0

// test_TxHandler will be tested async
var mtx sync.RWMutex
var wg = new(sync.WaitGroup)
var notifier *Notifier

func test_TxHandler(_ *bitumjson.TxRawResult) error {
	mtx.Lock()
	defer mtx.Unlock()
	defer wg.Done()
	callCounter++
	return nil
}

var test_TxHandler_2 = test_TxHandler

func test_BlockHandler(_ *wire.BlockHeader) error {
	defer wg.Done()
	callCounter++
	return nil
}
func test_BlockHandlerLite(_ uint32, _ string) error {
	defer wg.Done()
	callCounter++
	return nil
}
func test_ReorgHandler(reorg *txhelpers.ReorgData) error {
	defer wg.Done()
	callCounter++
	notifier.SetPreviousBlock(reorg.NewChainHead, uint32(reorg.NewChainHeight))
	return nil
}

func TestNotifier(t *testing.T) {
	ctx, shutdown := context.WithCancel(context.Background())
	notifier = NewNotifier(ctx)
	signals := notifier.BitumdHandlers()
	notifier.RegisterTxHandlerGroup(test_TxHandler, test_TxHandler_2)
	notifier.RegisterBlockHandlerGroup(test_BlockHandler)
	notifier.RegisterBlockHandlerLiteGroup(test_BlockHandlerLite)
	notifier.RegisterReorgHandlerGroup(test_ReorgHandler)
	wg.Add(5)

	notifier.Listen(&dummyNode{})

	prevBlock := newHash()
	header := wire.BlockHeader{
		PrevBlock: *prevBlock,
		Height:    uint32(counter),
	}
	notifier.previous.hash = *prevBlock
	bytes, _ := header.Bytes()
	signals.OnBlockConnected(bytes, nil)

	oldHash := newHash()
	ohdHeight := int32(counter)
	newHash := newHash()
	newHeight := counter
	signals.OnReorganization(oldHash, ohdHeight, newHash, int32(newHeight))

	signals.OnTxAcceptedVerbose(new(bitumjson.TxRawResult))

	wg.Wait()

	if notifier.previous.hash.String() != newHash.String() {
		t.Errorf("unexpected previous.hash after reorg. %s != %s",
			notifier.previous.hash.String(), newHash.String())
	}

	if notifier.previous.height != uint32(newHeight) {
		t.Errorf("unexpected previous.height after reorg. %d != %d",
			notifier.previous.height, uint32(newHeight))
	}

	if callCounter != 5 {
		t.Errorf("callCounter = %d. Should be 5.", callCounter)
	}

	shutdown()
}
