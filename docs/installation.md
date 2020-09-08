# NCTL installation

### Step 0 - pre-requisites.

1. python + pip.   
2. make + cargo.
3. https://github.com/CasperLabs/casper-node

### Step 1 - install pre-requisites.

```
pip install --upgrade pip
pip install --upgrade supervisord
```

### Step 2 - set required installaton paths.

```
# Set install directory.
path_nctl_install=YOUR_WORKING_DIRECTORY

# Set path to your ~/.bashrc | ~/.bash_profile file.
path_bashrc=PATH_TO_YOUR_BASHRC_FILE

# Set path to directory continaing casper-node repo.
path_casper_node=PATH_TO_YOUR_CASPER_NODE_REPO
```

### Step 3 - install source

```
git clone https://github.com/CasperLabs/nctl.git $path_nctl_install/nctl
```

### Step 4 - set local setup file

```
cat >> $HOME/.casper-nctl <<- EOM

# Path to local casper-node repo.
export NCTL_CASPER_HOME=$path_casper_node

# Activate nctl shell.
source ${path_nctl_install}/nctl/activate

EOM
```

### Step 5 - extend bashrc file to make nctl commands available from terminal session.

```
cat >> $path_bashrc <<- EOM

# ----------------------------------------------------------------------
# CASPER - NCTL
# ----------------------------------------------------------------------

# Activate nctl shell.
source $HOME/.casper-nctl

EOM
```
