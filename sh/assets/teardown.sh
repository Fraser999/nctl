#!/bin/bash
#
# Tears down an entire network.
# Globals:
#   NCTL - path to nctl home directory.
#   NCTL_DAEMON_TYPE - type of daemon service manager.
# Arguments:
#   Network ordinal identifer.

#######################################
# Destructure input args.
#######################################

for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   
    case "$KEY" in
        net) net=${VALUE} ;;
        *)   
    esac    
done

#######################################
# Main
#######################################

log "network #$net: tearing down assets ... please wait"

# Import utils.
source $NCTL/sh/utils/misc.sh

# Stop all spinning nodes.
source $NCTL/sh/node/stop.sh net=$net node=all

# Kill service daemon (if appropriate).
if [ $NCTL_DAEMON_TYPE = "supervisord" ]; then
    source $NCTL/sh/daemon/supervisord/daemon_kill.sh $net
fi

# Delete artefacts.
rm -rf $NCTL/assets/net-$net

log "network #$net: assets torn down."
