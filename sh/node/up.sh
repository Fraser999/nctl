function _spinup_node()
{
    export RUST_LOG=info
    $CASPER_NODE validator --config $NTCL_INFRA/node-$1/config.toml
}