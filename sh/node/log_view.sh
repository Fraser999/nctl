#!/bin/bash
#
# Displays node logs.
# Globals:
#   NCTL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#   Log type.

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
        typeof) typeof=${VALUE} ;;
        *)   
    esac    
done

#######################################
# Main
#######################################

vi $NCTL/assets/net-$net/nodes/node-$node/logs/$typeof.log
