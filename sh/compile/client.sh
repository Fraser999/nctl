#!/bin/bash
#
#######################################
# Compiles client software.
# Globals:
#   NCTL_CASPER_HOME - path to casper node repo.
#   NCTL - path to nctl home directory.
########################################

source $NCTL/sh/utils/misc.sh
pushd $NCTL_CASPER_HOME/client
cargo build
popd -1
