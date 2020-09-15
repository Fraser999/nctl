#!/usr/bin/env bash
#
# Resets node logs.
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

if [ $node = "all" ]; then
    source $NCTL/assets/net-$net/vars
    for node_id in $(seq 1 $NCTL_NET_NODE_COUNT)
    do
        rm $NCTL/assets/net-$net/nodes/node-$node_id/logs/*.log > /dev/null 2>&1
    done
else
    rm $NCTL/assets/net-$net/nodes/node-$node/logs/*.log > /dev/null 2>&1
fi
