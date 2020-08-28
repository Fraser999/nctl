#!/bin/bash

# Import utils.
source $NCTL/sh/utils/misc.sh

# Main entry point.
function main()
{
    printenv | grep NCTL_ | sort
}

# Invoke entry point.
main
