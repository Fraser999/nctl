#!/bin/bash

# Import utils.
source $NTCL/sh/utils/misc.sh

# Main entry point.
function main()
{
	sh $NTCL/sh/daemons/stop.sh -n $1
	sh $NTCL/sh/daemons/start.sh -n $1
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
