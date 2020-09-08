#!/bin/bash
#
# Interactively spins up a node within a network.
# Globals:
#   NCTL - path to nctl home directory.
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
$NCTL/assets/net-$net/bin/casper-node validator $NCTL/assets/net-$net/nodes/node-$node/config/node-config.toml
