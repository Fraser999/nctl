#!/bin/bash
#
#######################################
# Spins up a node within a network.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################

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

# Reset logs.
sh $NTCL/sh/node/reset_logs.sh net=$net node=$node

# Start node.
source $NTCL/sh/daemons/supervisord/node_start.sh $net $node
