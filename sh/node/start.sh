#!/usr/bin/env bash
#
# Starts up a node within a network.
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

source $NCTL/sh/node/log_reset.sh net=$net node=$node
if [ $NCTL_DAEMON_TYPE = "supervisord" ]; then
    source $NCTL/sh/daemon/supervisord/node_start.sh $net $node
fi
