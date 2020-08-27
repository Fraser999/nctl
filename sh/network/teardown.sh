#!/bin/bash
#
# Destroys artefacts previously created to run an N node network.

# Import utils.
source $NTCL/sh/utils/misc.sh

#######################################
# Main entry point
# Arguments:
#   Network ordinal identifer.
#######################################
function main() {
    log "tearing down network:"

    _teardown_artefacts $1
    _teardown_daemons $1
}

#######################################
# Tears down artefacts pertaining to a network.
# Arguments:
#   Network ordinal identifer.
#######################################
function _teardown_artefacts() {
    log "... artefacts"

    rm -rf $NTCL/nets/net-$1
}

#######################################
# Tears down artefacts pertaining to a network.
# Arguments:
#   Network ordinal identifer.
#######################################
function _teardown_daemons() {
    log "... daemons"

    echo "TODO: auto stop active network daemons"
}

#######################################
# CLI entry point
# Arguments:
#   Network ordinal identifer.
#   Count of nodes to setup.
#   Count of users to setup.
#######################################
# Destructure input args.
for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   
    case "$KEY" in
        net) net=${VALUE} ;;
        *)   
    esac    
done

# Invoke entry point.
main $net
