#!/bin/bash
#
# Resets node logs.

# Destructure args.
for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   
    case "$KEY" in
        net) net=${VALUE} ;;
        node) node=${VALUE} ;;
        *)   
    esac    
done

# Reset logs.
rm $NTCL/nets/net-$net/nodes/node-$node/logs/*.log
