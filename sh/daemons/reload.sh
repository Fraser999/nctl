#!/bin/bash

# Import utils.
source $NTCL/sh/utils/misc.sh

# Main entry point.
function main()
{
	source $NTCL/sh/daemons/stop.sh
	source $NTCL/sh/daemons/start.sh
}

# Invoke entry point.
main
