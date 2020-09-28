#!/usr/bin/env bash
#
#######################################
# Toggles a network node.
# Globals:
#   NCTL - path to nctl home directory.
# Arguments:
#   Network ordinal identifier.
#   Node ordinal identifier.
#######################################

# Import utils.
source $NCTL/sh/daemon/supervisord/utils.sh

echo $1
echo $2

node_status=$(supervisorctl -c "$(get_path_net_supervisord_cfg $1)" status "$(get_node_process_name $1 $2)")

case "$node_status" in 
  *RUNNING*)
    source $NCTL/sh/daemon/supervisord/node_stop.sh $1 $2
    ;;
  *STOPPED*)
    source $NCTL/sh/daemon/supervisord/node_start.sh $1 $2
    ;;
esac


# TODO: move Display nodeset state to containing.
sleep 2.0
source $NCTL/sh/daemon/supervisord/node_status.sh $1



# Ensure daemon is up.
# source $NCTL/sh/daemon/supervisord/daemon_start.sh $1

# Stop nodeset.
# if [ $2 = "all" ]; then
#     supervisorctl -c "$(get_path_net_supervisord_cfg $1)" stop all  > /dev/null 2>&1
# else
#     supervisorctl -c "$(get_path_net_supervisord_cfg $1)" stop "$(get_node_process_name $1 $2)"  > /dev/null 2>&1
# fi

# Display nodeset state.
# sleep 2.0
# source $NCTL/sh/daemon/supervisord/node_status.sh $1
