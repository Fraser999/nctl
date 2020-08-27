#!/bin/bash
#
#######################################
# Starts supervisord (if necessary).
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#######################################

source $NTCL/sh/daemons/supervisord/utils.sh
if [ ! -e "$(get_path_net_supervisord_sock $1)" ]; then
    supervisord -c "$(get_path_net_supervisord_cfg $1)"
    sleep 3.0
fi
