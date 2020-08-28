# nctl Commands

## Overview

Upon successful installation, a set of nctl commands are available for execution from within a terminal session.  All such commands are prefixed by `nctl-` and allow you to perform tasks:

- create artefacts for an N-node network;
- start/stop individual nodes within the network;
- start/stop entire network;

## Compiling network binaries

#### `nctl-compile-node`

Compiles casper node software using `make`.

#### `nctl-compile-client`

Compiles casper client software using `cargo`. 

## Managing network assets

#### `nctl-network-setup net={X} nodes={Y} users={Z}`

Sets up assets required to run a local N-node network - this includes binaries, chainspec, config, faucet, keys, certs ... etc.  

e.g. `nctl-network-setup net=1 nodes=5 users=5` creates assets required to run a 5 node network (network id = 1).

#### `nctl-network-teardown net={X}`

Stops network and destroys all related assets.  

e.g. `nctl-network-teardown net=1`
