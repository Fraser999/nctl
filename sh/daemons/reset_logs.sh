#!/bin/bash

# Import utils.
source $NTCL/sh/utils/shared.sh

# Main entry point.
function main()
{
    rm $NTCL/nets/net-*/daemon/logs/*.log
    rm $NTCL/nets/net-*/nodes/node-*/logs/*.log
}

# Invoke entry point.
main
