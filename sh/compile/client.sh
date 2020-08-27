#!/bin/bash
#
# Compiles node software.

# Import utils.
source $NTCL/sh/utils/misc.sh

#######################################
# Main entry point
# Globals:
#   CASPER_HOME - path to node software github repo.
#######################################
function main() {
    log "compiling client ..."

    pushd $CASPER_HOME/client
    cargo build
    popd -1
}

# Invoke entry point.
main
