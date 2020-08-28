# nctl Commands

## Overview

Upon successful installation, a set of nctl commands are available for execution from within a terminal session.  All such commands are prefixed by `nctl-` and allow you to perform various tasks as detailed below.

NOTE: all network & node ordinal identifiers are 1 based.

## Compiling network binaries

#### `nctl-compile-node`

Compiles casper node software using `make` + `cargo`.

#### `nctl-compile-client`

Compiles casper client software using `cargo`. 

## Managing network assets

#### `nctl-assets-setup net={X} nodes={Y} users={Z}`

Sets up assets required to run a local N-node network - this includes binaries, chainspec, config, faucet, keys, certs ... etc.  

e.g. `nctl-assets-setup net=1 nodes=5 users=5` creates assets required to run a 5 node network (network id = 1), additionally creates a set of test users.

#### `nctl-assets-teardown net={X}`

Stops network & destroys all related assets.  

e.g. `nctl-network-teardown net=1`

## Controlling network nodes

#### `nctl-node-interactive net={X} node={Y}`

Starts (in interactive mode) node Y in network X.

e.g. `nctl-node-interactive net=1 node=3`

#### `nctl-node-restart net={X} node={Y}`

Restarts node Y in network X.  If Y=all then all nodes in the network are restarted.

e.g. `nctl-node-restart net=1 node=3`  

e.g. `nctl-node-restart net=1 node=all`

#### `nctl-node-reset-logs net={X} node={Y}`

Resets logs of node Y in network X.  If Y=all then the logs of all nodes are reset.

e.g. `nctl-node-reset-logs net=1 node=3`  

e.g. `nctl-node-reset-logs net=1 node=all`

#### `nctl-node-start net={X} node={Y}`

Starts node Y in network X.  If Y=all then all nodes in the network are restarted.

e.g. `nctl-node-start net=1 node=3`  

e.g. `nctl-node-start net=1 node=all`

#### `nctl-node-status net={X} node={Y}`

Displays status of node Y in network X.  If Y=all then all status of all nodes in the network are displayed.

e.g. `nctl-node-status net=1 node=3`  

e.g. `nctl-node-status net=1 node=all`

#### `nctl-node-stop net={X} node={Y}`

Stops node Y in network X.  If Y=all then all nodes in the network are stopped.

e.g. `nctl-node-stop net=1 node=3`  

e.g. `nctl-node-stop net=1 node=all`
