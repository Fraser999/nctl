# STESTS Usage

Once installed, nctl commands can be used to setup & control nodes within local test network(s).  It is assumed that whilst most nctl users focus upon testing a single network, developers may wish to test multiple networks in parallel in order to observe behavioural differences induced as a result of altering either the network's configuration or it's binary set.  

## Step 0: Compile network binaries.

Prior to testing a network we need to ensure that the binary set is available:

```
nctl-compile-node
nctl-compile-client
```

## Step 1: Create network assets.

- Once network binaries are available we proceed to setup test network assets.  The following command instantiates the full set of assets required to run network 1.  The assets are copied to `$NCTL/nets/net-1`, where $NCTL is the nctl home directory.

```
nctl-setup net=1 nodes=5 users=5
```

- Examining the contents of `$NCTL/nets/net-1` you will observe the following (self-explanatory) sub-folders:

```
/bin
/chainspec
/daemon
/faucet
/nodes
/users
```

- If we wish, for example, to test a modification to the node software, we can make the code modification, recompile the binary set, create a new set of network assets by incrementing the network identifier to 2.  At this point we will have 2 test networks ready to be run side by side.

## Step 3: Start a node in interactive mode.

We can start a node interactively - this is useful to verify that the network assets have been correctly established and that the network is ready for testing.

```
nctl-interactive net=1 node=1
```

Sets up required network artefacts:

- network chainspec
- network daemon controllers
- network faucet
- node binaries
- node certs
- node configuration
- node keys
- node log directory
- node storage directory
- user keys

Artefacts are copied to the following locations:

```
$NCTL_HOME/nets/{id}
```
