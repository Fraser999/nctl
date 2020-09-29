# nctl Commands

## Overview

Upon successful installation, a set of nctl commands are available for execution from within a terminal session.  All such commands are prefixed by `nctl-` and allow you to perform various tasks as detailed below.

NOTE 1: all network & node ordinal identifiers are 1 based.

NOTE 2: all command parameterrs have default values to simplify the general case of testing a single local network.

## Compiling network binaries

### nctl-compile

Compiles casper node + client software using `make` + `cargo`.

### nctl-compile-node

Compiles casper node software using `make` + `cargo`.

### nctl-compile-client

Compiles casper client software using `cargo`.

## Managing network assets

### nctl-assets-ls

List previously created network assets.

### nctl-assets-setup net={X:-1} nodes={Y:-5} users={Z:-5}

Sets up assets required to run a local N-node network - this includes binaries, chainspec, config, faucet, keys ... etc.

e.g. `nctl-assets-setup`

e.g. `nctl-assets-setup net=1 nodes=5 users=5`  (same as above)

e.g. `nctl-assets-setup net=2 nodes=10 users=10`

NOTE: default

### nctl-assets-teardown net={X:-1}

Stops network & destroys all related assets.

e.g. `nctl-assets-teardown`

e.g. `nctl-assets-teardown net=1`  (same as above)

e.g. `nctl-assets-teardown net=2`

### nctl-assets-dump net={X:-1}

Dumps transient network assets such as logs + configuration.

e.g. `nctl-assets-dump`

e.g. `nctl-assets-dump net=1`  (same as above)

## Controlling network nodes

### nctl-interactive net={X:-1} node={Y:-1} loglevel={Z:-($NCTL_NODE_LOG_LEVEL | debug)}

Starts (in interactive mode) node Y in network X.

e.g. `nctl-interactive`

e.g. `nctl-interactive net=1 node=1`  (same as above)

e.g. `nctl-interactive net=1 node=3`

Note - log level output can be overrriden either by assigning the NCTL_NODE_LOG_LEVEL env. var. or the `loglevel` parameter.

### nctl-log-reset net={X:-1} node={Y:-all}

Resets logs of node Y in network X.  If Y=all then the logs of all nodes are reset.

e.g. `nctl-log-reset`

e.g. `nctl-log-reset net=1 node=all`  (same as above)

e.g. `nctl-log-reset net=1 node=3`


### nctl-log-view net={X:-1} node={Y:-1} typeof={Z:-stdout}

Displays log of node Y in network X.  Z=stdout|stderr.

e.g. `nctl-log-view`

e.g. `nctl-log-view net=1 node=1 typeof=stdout`  (same as above)

e.g. `nctl-log-view net=1 node=3 typeof=stderr`


### nctl-restart net={X:-1} node={Y:-all}

Restarts node Y in network X.  If Y=all then all nodes in the network are restarted.

e.g. `nctl-restart`

e.g. `nctl-restart net=1 node=all`  (same as above)

e.g. `nctl-restart net=1 node=3`


### nctl-start net={X:-1} node={Y:-all} loglevel={Z:-($NCTL_NODE_LOG_LEVEL | debug)}

Starts node Y in network X.  If Y=all then all nodes in the network are restarted.

e.g. `nctl-start`

e.g. `nctl-start net=1 node=all`  (same as above)

e.g. `nctl-start net=1 node=3`

Note - log level output can be overrriden either by assigning the NCTL_NODE_LOG_LEVEL env. var. or the `loglevel` parameter.

### nctl-status net={X:-1}

Displays status of all nodes in network X.

e.g. `nctl-status`

e.g. `nctl-status net=1`  (same as above)


### nctl-stop net={X:-1} node={Y:-all}

Stops node Y in network X.  If Y=all then all nodes in the network are stopped.

e.g. `nctl-stop`

e.g. `nctl-stop net=1 node=all`  (same as above)

e.g. `nctl-stop net=1 node=3`

### nctl-view-metrics net={X:-1} node={Y:-1}

Renders metrics of node Y in network X to stdout.

e.g. `nctl-view-metrics`

e.g. `nctl-view-metrics net=1 node=1`  (same as above)

e.g. `nctl-view-metrics net=1 node=3`

### nctl-view-status net={X:-1} node={Y:-1}

Renders status of node Y in network X to stdout.

e.g. `nctl-view-status`

e.g. `nctl-view-status net=1 node=1`  (same as above)

e.g. `nctl-view-status net=1 node=3`

### nctl-wg-100 net={X:-1} node={Y:-1} payment={P:-200000} gas={G:-10} transfers={T:-100} interval={I:-0.01} user={U:-1}

Dispatches to node Y in network X, T wasmless transfers from network faucet to user #U.  If node=all then transfers are dispatched to nodes in a round-robin fashion.

e.g. `nctl-wg-100`

e.g. `nctl-wg-100 net=1 node=1 payment=200000 gas=10 transfers 100 interval=0.01 user=1`  (same as above)

e.g. `nctl-wg-100 transfers 10000 interval=0.001`

### nctl-wg-110 net={X:-1} node={Y:-1} payment={P:-200000} gas={G:-10} transfers={T:-100} interval={I:-0.01} user={U:-1}

Dispatches to node Y in network X, T wasm based transfers from network faucet to user #U.  If node=all then transfers are dispatched to nodes in a round-robin fashion.

e.g. `nctl-wg-110`

e.g. `nctl-wg-110 net=1 node=1 payment=200000 gas=10 transfers 100 interval=0.01 user=1`  (same as above)

e.g. `nctl-wg-110 transfers 10000 interval=0.001`
