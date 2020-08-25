#!/bin/bash

# Import utils.
source $NTCL/sh/utils/misc.sh

# Main entry point.
function main()
{
	supervisorctl -c $NTCL/nets/net-$1/daemon/config/supervisord.conf status all
}


# Destructure input args.
for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   
    case "$KEY" in
            net)              net=${VALUE} ;;
            *)   
    esac    
done

# Invoke entry point.
main $net
