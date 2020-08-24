#!/bin/bash

# Import utils.
source $NTCL/sh/utils/shared.sh

# Main entry point.
function main()
{
    printenv | grep NCTL_ | sort
}

# Invoke entry point.
main
