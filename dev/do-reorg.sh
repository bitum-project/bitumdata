#!/usr/bin/env bash

set -e

SESSION="bitumd-parallel-nodes"

# mine some on both nodes
tmux send-key -t bitumd-parallel-nodes:0.0 "./mine-both" C-m

sleep 6

# disconnect b from a
tmux send-key -t bitumd-parallel-nodes:2.1 "./ctl addnode 127.0.0.1:19200 remove" C-m

sleep 2

# mine a block on node a
tmux send-key -t bitumd-parallel-nodes:1.1 "./mine" C-m

# mine 3 blocks on node b
tmux send-key -t bitumd-parallel-nodes:2.1 "./mine" C-m
tmux send-key -t bitumd-parallel-nodes:2.1 "./mine" C-m
tmux send-key -t bitumd-parallel-nodes:2.1 "./mine" C-m

sleep 4

# reconnect b to a
tmux send-key -t bitumd-parallel-nodes:2.1 "./ctl addnode 127.0.0.1:19200 add" C-m

sleep 2

grep REORG ~/bitumdsimnet/alpha/log/simnet/bitumd.log
