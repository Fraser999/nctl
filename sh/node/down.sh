#!/bin/bash
#
#######################################
# Tears down a node within a network.
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

source $NTCL/sh/daemons/supervisord/node_stop.sh $net $node
