# nctl Usage

Once installed, nctl commands can be used to setup & control nodes within local test network(s).  Whilst most nctl users will tend to focus upon testing a single network, developers may wish to test multiple networks in parallel so as to observe behavioural differences induced as a result of altering either the network's configuration or its binary set.  

This usage guide focusses upon the former use case, i.e. testing a single network, and thus all nctl commands described below are executed with their default values.  Please refer [here](commands.md) for full details of supported nctl commands.

## Step 0: Compile network binaries.

Prior to testing a network we need to ensure that the binary sets arre available:

```
nctl-compile
```

## Step 1: Create network assets.

- Once network binaries are available we proceed to setup test network assets.  The following command instantiates the full set of assets required to run a 5 node local network with 5 users.  The assets are copied to `$NCTL/assets/net-1`, where $NCTL is the nctl home directory.

```
nctl-assets-setup
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
/config
/keys
/logs
/storage
```

- Once assets have been created you are advised to review contents of toml files, i.e. `/chainspec/chainspec.toml` & the various `/nodes/node-X/config/node-config.toml` files.

- If we wish to test a modification to the node software, we can make the code modification, recompile the binary set, create a new set of network assets by incrementing the network identifier to 2.  At this point we will have 2 test networks ready to be run side by side.

- If we wish to test modifications to a network's chainspec, we can:

```
vi $NCTL/assets/net-1/chainspec/chainspec.toml
```

- If we wish to test modifications to a node's config, e.g. node 3, we can:

```
vi $NCTL/assets/net-1/nodes/node-3/config/node-config.toml
```

## Step 2: Start a node in interactive mode.

We can start a node interactively - this is useful to verify that the network assets have been correctly established and that the network is ready for testing.

```
# Start node 1 interactively.
nctl-interactive

# Start node 4 interactively.
nctl-interactive node-4
```

## Step 3: Start a network in daemon mode.

- We can start either all nodes or a single nodes within a network in daemon mode.  This is the preferred modus operandi.

```
# Start all nodes in daemon mode.
nctl-start

# Start node 1 in daemon mode.
nctl-start node=1
```

- We can observe the status of all daemonised nodes within a network as follows:

```
nctl-status
```

- We can restart either a single or all daemonised nodes within a network as follows:

```
# Restart all nodes.
nctl-restart 

# Restart node 1.
nctl-restart node=1
```

- We can stop either a single or all daemonised nodes within a network as follows:

```
# Stop all nodes.
nctl-stop 

# Stop node 1.
nctl-stop node=1
```

## Step 4: Dump logs & other files.

If having observed a network behavioural anomaly we can dump relevant files such as logs and configurationas follows:

```
nctl-assets-dump
```

- This writes dumped files -> $NCTL/dumps/net-1

## Step 5: End testing session.

Once a network testing session is complete we can teardown the network as follows:

```
nctl-assets-teardown
```

Not only does this delete all previously created assets, it also stops any nodes still running in daemon mode.

## Summary

Using nctl one can spin up either a single or multiple test networks.  Each network is isolated in terms of its assets - this includes port numbers.  The nctl commands parrameter defaults are set for the general use case of testing a single local 5 node network.  You are encouraged to integrate nctl into your daily workflow so as to standardise the manner in which the network is tested in a localised setting.
