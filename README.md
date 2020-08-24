# nctl
CLI application to control a local casper network 


nctl
===============

CLI application to control a local Casper network 

What is nctl ?
--------------------------------------

nctl stands for network|node control.  It's goal is to simplfy localised control of a test Casperr network.


Why nctl ?
--------------------------------------

Many developers & community users will wish to spin up relatively small test networks in a localised setting.  Adopting a standardised approach is thus helpful.


Who uses nctl ?
--------------------------------------

CLX network community.  This encompasses developers, validators, evaluators ... etc.

Requirements
--------------------------------------

    - supervisord
    - bash

Installation
--------------------------------------

```
# Step 1: set your install directory + bashrc path.
INSTALL_DIR=path-to-your-working-director
BASHRC_PATH=path-to-your-bashrc-file

# Step 2: install repo.
cd INSTALL_DIR
git clone https://github.com/CasperLabs/nctl.git

# Step 3: make nctl commands available from terminal sessions.
cat >> $BASHRC_PATH <<- EOM

# ----------------------------------------------------------------------
# CASPERLABS - NCTL
# ----------------------------------------------------------------------

source ${INSTALL_DIR}/ntcl/activate

EOM
```

Commands
--------------------------------------

Once installed a set of [commands](docs/commands.md) are available for use within a terminal session.

Usage
--------------------------------------

See [usage](docs/usage.md) for further information.
