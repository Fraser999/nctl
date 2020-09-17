# nctl Commands

## Overview

Upon successful installation, a set of nctl commands are available for execution from within a terminal session.  All such commands are prefixed by `nctl-` and allow you to perform various tasks as detailed below.

NOTE: all network & node ordinal identifiers are 1 based.

## Compiling network binaries

### nctl-compile-node

Compiles casper node software using `make` + `cargo`.

### nctl-compile-client

Compiles casper client software using `cargo`.

## Managing network assets

### nctl-assets-ls

List previously created network assets.

### nctl-assets-setup net={X} nodes={Y} users={Z}

Sets up assets required to run a local N-node network - this includes binaries, chainspec, config, faucet, keys ... etc.

e.g. `nctl-assets-setup net=1 nodes=5 users=5` creates assets required to run a 5 node network (network id = 1), additionally creates a set of test users.

### nctl-assets-teardown net={X}

Stops network & destroys all related assets.

e.g. `nctl-assets-teardown net=1`

## Controlling network nodes

### nctl-interactive net={X} node={Y}

Starts (in interactive mode) node Y in network X.

e.g. `nctl-interactive net=1 node=3`

### nctl-log-reset net={X} node={Y}

Resets logs of node Y in network X.  If Y=all then the logs of all nodes are reset.

e.g. `nctl-log-reset net=1 node=3`

e.g. `nctl-log-reset net=1 node=all`

### nctl-log-view net={X} node={Y} typeof={Z}

Displays log of node Y in network X.  Z=stdout|stderr.

e.g. `nctl-log-view net=1 node=3 typeof=stderr`

e.g. `nctl-log-view net=1 node=1 typeof=stdout`

### nctl-restart net={X} node={Y}

Restarts node Y in network X.  If Y=all then all nodes in the network are restarted.

e.g. `nctl-restart net=1 node=3`

e.g. `nctl-restart net=1 node=all`

### nctl-start net={X} node={Y}

Starts node Y in network X.  If Y=all then all nodes in the network are restarted.

e.g. `nctl-start net=1 node=3`

e.g. `nctl-start net=1 node=all`

### nctl-status net={X}

Displays status of all nodes in network X.

e.g. `nctl-status net=1`

### nctl-stop net={X} node={Y}

Stops node Y in network X.  If Y=all then all nodes in the network are stopped.

e.g. `nctl-stop net=1 node=3`

e.g. `nctl-stop net=1 node=all`
