#!/bin/bash
#
#######################################
# Stops a network node.
# Globals:
#   NCTL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################

# Import utils.
source $NCTL/sh/daemon/supervisord/utils.sh

# Ensure daemon is up.
source $NCTL/sh/daemon/supervisord/daemon_start.sh $1 

# Stop nodeset.
if [ $2 = "all" ]; then
    supervisorctl -c "$(get_path_net_supervisord_cfg $1)" stop all  > /dev/null 2>&1
else
    supervisorctl -c "$(get_path_net_supervisord_cfg $1)" stop "$(get_node_process_name $1 $2)"  > /dev/null 2>&1
fi

# Display nodeset state.
sleep 2.0
source $NCTL/sh/daemon/supervisord/node_status.sh $1 $2
