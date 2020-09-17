#!/usr/bin/env bash
#
#######################################
# Compiles node software.
# Globals:
#   NCTL_CASPER_HOME - path to casper node repo.
#   NCTL - path to nctl home directory.
########################################

source $NCTL/sh/utils/misc.sh
pushd $NCTL_CASPER_HOME
make setup-rs
make build-system-contracts
cargo build --release --package casper-node
popd -1
