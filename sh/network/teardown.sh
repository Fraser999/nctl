#!/bin/bash
#
# Tears down an entire network.
# Globals:
#   NTCL - path to nctl home directory.
#   NTCL_DAEMON_TYPE - type of daemon service manager.
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

# Stop all spinning nodes.
sh $NTCL/sh/node/stop.sh net=$net node=all

# Kill service daemon (if appropriate).
if [ $NTCL_DAEMON_TYPE = "supervisord" ]; then
    sh $NTCL/sh/daemon/supervisord/daemon_kill.sh $net
fi

# Delete artefacts.
rm -rf $NTCL/nets/net-$net
