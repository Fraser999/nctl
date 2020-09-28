#!/bin/bash
#
# Starts up a node within a network.
# Globals:
#   NCTL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.

# Import utils.
source $NCTL/sh/utils/misc.sh

#######################################
# Destructure input args.
#######################################

# Unset to avoid parameter collisions.
unset loglevel
unset net
unset node

for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   
    case "$KEY" in
        loglevel) loglevel=${VALUE} ;;
        net) net=${VALUE} ;;
        node) node=${VALUE} ;;
        *)   
    esac    
done

# Set defaults.
loglevel=${loglevel:-$NCTL_NODE_LOG_LEVEL}
loglevel=${loglevel:-debug}
net=${net:-1}
node=${node:-all}

#######################################
# Main
#######################################

log "network #$net: starting node(s) ... please wait"

# Set rust log level.
export RUST_LOG=$loglevel

# Reset logs.
source $NCTL/sh/node/log_reset.sh net=$net node=$node  

# Set daemon handler.
if [ $NCTL_DAEMON_TYPE = "supervisord" ]; then
    daemon_handler=$NCTL/sh/daemon/supervisord/node_start.sh
fi

# Start node(s) by passing through to daemon specific handler.
if [ $node = "all" ]; then
    source $NCTL/assets/net-$net/vars
    for node_idx in $(seq 1 $NCTL_NET_NODE_COUNT)
    do
        log "network #$net: starting node $node_idx ..."
        if [ $NCTL_DAEMON_TYPE = "supervisord" ]; then
            source $NCTL/sh/daemon/supervisord/node_start.sh $net $node_idx
        fi
        if [ $node_idx = 1 ]; then  # ensure bootstrap nodes are running.
            sleep 1.0
        fi
    done
else
    if [ $NCTL_DAEMON_TYPE = "supervisord" ]; then
        source $NCTL/sh/daemon/supervisord/node_start.sh $net $node
    fi
fi

# Display status.
sleep 1.0
source $NCTL/sh/node/status.sh $net
