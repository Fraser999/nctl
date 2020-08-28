#!/bin/bash
#
# Interactively spins up a node within a network.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.

#######################################
# Destructure input args.
#######################################

for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   
    case "$KEY" in
        net) net=${VALUE} ;;
        node) node=${VALUE} ;;
        *)   
    esac    
done

#######################################
# Main
#######################################

export RUST_LOG=info
$CASPER_NODE validator --config $NTCL/nets/net-$net/nodes/node-$node/config/node-config.toml
