#!/bin/bash
#
#######################################
# Kills supervisord (if necessary).
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#######################################

source $NTCL/sh/daemon/supervisord/utils.sh
if [ -e "$(get_path_net_supervisord_sock $1)" ]; then
	supervisorctl -c "$(get_path_net_supervisord_cfg $1)" stop all &>/dev/null 
    supervisorctl -c "$(get_path_net_supervisord_cfg $1)" status &>/dev/null
	supervisorctl -c "$(get_path_net_supervisord_cfg $1)" shutdown &>/dev/null
fi
