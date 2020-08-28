#!/bin/bash
#
# Spins up a node within a network.
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

sh $NTCL/sh/node/reset_logs.sh net=$net node=$node
# TODO: use env var to route to appropriate daemon controller.
source $NTCL/sh/daemon/supervisord/node_start.sh $net $node
