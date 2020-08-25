#!/bin/bash

# Import utils.
source $NTCL/sh/utils/misc.sh

# Main entry point.
function main()
{
    rm $NTCL/nets/net-$1/daemon/logs/*.log
    rm $NTCL/nets/net-$1/nodes/node-*/logs/*.log
}

# Destructure input args.
while getopts n: flag
do
    case "${flag}" in
        n) network=${OPTARG};;
    esac
done

# Invoke entry point.
main $network
