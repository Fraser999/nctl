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

# Destructure input args.
while getopts i: flag
do
    case "${flag}" in
        i) idx=${OPTARG};;
    esac
done

# Invoke entry point.
main $idx
