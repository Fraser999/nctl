#!/usr/bin/env bash
#
#######################################
# Compiles client software.
# Globals:
#   NCTL_CASPER_HOME - path to casper node repo.
#   NCTL - path to nctl home directory.
########################################

# Import utils.
source $NCTL/sh/utils/misc.sh

pushd $NCTL_CASPER_HOME
cargo build --release --package casper-client
popd -1
