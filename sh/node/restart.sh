#!/usr/bin/env bash
#
# Reloads a network node.
# Globals:
#   NCTL - path to nctl home directory.
# Arguments:
#   Network ordinal identifier.
#   Node ordinal identifier.

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

source $NCTL/sh/node/stop.sh net=$net node=$node
source $NCTL/sh/node/start.sh net=$net node=$node
