#!/bin/bash
#
# Interactively spins up a node within a network.

# Import utils.
source $NTCL/sh/utils/misc.sh

#######################################
# Main entry point
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################
function main() {
    export RUST_LOG=info
    $CASPER_NODE validator --config $NTCL/nets/net-$1/nodes/node-$2/config/node-config.toml
}

#######################################
# CLI entry point
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################
# Destructure input args.
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

# Invoke entry point.
main $net $node
