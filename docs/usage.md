# STESTS Usage

Once installed nctl commands can be used to setup & control local test network(s).  

## Setup a network

```
nctl-network-setup {id} {node-count} {user-count}
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
