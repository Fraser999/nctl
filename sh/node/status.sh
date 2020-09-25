#!/usr/bin/env bash
#
# Displays node status.
# Globals:
#   NCTL - path to nctl home directory.
# Arguments:
#   Network ordinal identifier.

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

# Set defaults.
net=${net:-1}

#######################################
# Main
#######################################

if [ $NCTL_DAEMON_TYPE = "supervisord" ]; then
    source $NCTL/sh/daemon/supervisord/node_status.sh $net
fi
