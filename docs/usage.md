# NCTL Usage

Once installed, nctl commands can be used to setup & control nodes within local test network(s).  Whilst most nctl users will tend to focus upon testing a single network, developers may wish to test multiple networks in parallel so as to observe behavioural differences induced as a result of altering either the network's configuration or it's binary set.  

## Step 0: Compile network binaries.

Prior to testing a network we need to ensure that the binary set is available:

```
nctl-compile-node
nctl-compile-client
```

## Step 1: Create network assets.

- Once network binaries are available we proceed to setup test network assets.  The following command instantiates the full set of assets required to run network 1.  The assets are copied to `$NCTL/assets/net-1`, where $NCTL is the nctl home directory.

```
nctl-setup net=1 nodes=5 users=5
```

- Examining the contents of `$NCTL/assets/net-1` you will observe the following (self-explanatory) sub-folders:

```
/bin
/chainspec
/daemon
/faucet
/nodes
/users
```

- Examining the contents of `$NCTL/assets/net-1/nodes/node-1`, i.e. node 1, you will observe the following (self-explanatory) sub-folders:

```
/certs
/config
/keys
/logs
/storage
```

- If we wish to test a modification to the node software, we can make the code modification, recompile the binary set, create a new set of network assets by incrementing the network identifier to 2.  At this point we will have 2 test networks ready to be run side by side.

- If we test modifications to a network's chainspec, we can:

```
vi $NCTL/assets/net-1/chainspec/chainspec.toml
```

- If we test modifications to a node's config, e.g. node 3, we can:

```
vi $NCTL/assets/net-1/nodes/node-3/config/node-config.toml
```

## Step 3: Start a node in interactive mode.

We can start a node interactively - this is useful to verify that the network assets have been correctly established and that the network is ready for testing.

```
nctl-interactive net=1 node=1
```

## Step 4: Start a network in daemon mode.

- We can start either a single or all nodes within a network in daemon mode.  This is the preferred modus operandi.

```
# Start node 1 in daemon mode.
nctl-start net=1 node=1

# Start all nodes in daemon mode.
nctl-start net=1 node=all
```

- We can observe the status of either a single or all daemonised nodes within a network as follows:

```
# View status of node 1.
nctl-status net=1 node=1

# View status of all nodes.
nctl-status net=1 node=all
```

- We can restart either a single or all daemonised nodes within a network as follows:

```
# Restart node 1.
nctl-restart net=1 node=1

# Restart all nodes.
nctl-restart net=1 node=all
```

- We can stop either a single or all daemonised nodes within a network as follows:

```
# Stop node 1.
nctl-stop net=1 node=1

# Stop all nodes.
nctl-stop net=1 node=all
```

## Step 5: End testing session.

Once a network testing session is complete we can teardown the network as follows:

```
nctl-assets-teardown net=1
```

Not only does this delete all previously created assets, it also stops any nodes still running in daemon mode.

## Summary

Using nctl one can spin up either a single or multiple test networks.  Each network is isolated in terms of it's assets - this includes port numbers.  You are encouraged to integrate nctl into your daily workflow so as to standardise the manner in which the network is tested in a localised setting.
