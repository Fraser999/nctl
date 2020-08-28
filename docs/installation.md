# NCTL installation

## Option A: installation when using **supervisord** as service controller (RECOMMENDED).

### Step A.1 - install pre-requisites.

```
pip3 install --upgrade pip3
pip3 install --upgrade supervisord
```

### Step A.2 - set required installaton paths.

```
# Set install directory.
path_nctl_install=YOUR_WORKING_DIRECTORY

# Set path to your ~/.bashrc | ~/.bash_profile file.
path_bashrc=PATH_TO_YOUR_BASHRC_FILE

# Set path to directory continaing casper-node repo.
path_casper_node=PATH_TO_YOUR_CASPER_NODE_REPO
```

### Step A.3 - install source

```
git clone https://github.com/CasperLabs/nctl.git $path_nctl_install/nctl
```

### Step A.4 - activate shell

```
# Extend bashrc file so that nctl commands are available.
cat >> $path_bashrc <<- EOM

# ----------------------------------------------------------------------
# CASPER - NCTL
# ----------------------------------------------------------------------

# Path to local casper-node repo.
NCTL_CASPER_HOME=$path_casper_node

# Set type of nctl service controller to use.
NCTL_DAEMON_TYPE=supervisord

# Activate nctl shell.
source ${path_nctl_install}/nctl/activate

EOM
```

## Option B: installation when using systemd as service controller.

### Step B.1 - set required installaton paths.

```
# Set install directory.
path_nctl_install=YOUR_WORKING_DIRECTORY

# Set path to your ~/.bashrc | ~/.bash_profile file.
path_bashrc=PATH_TO_YOUR_BASHRC_FILE

# Set path to directory continaing casper-node repo.
path_casper_node=PATH_TO_YOUR_CASPER_NODE_REPO
```

### Step B.2 - install source

```
git clone https://github.com/CasperLabs/nctl.git $path_nctl_install/nctl
```

## Step B.3 - activate shell

```
# Extend bashrc file so that nctl commands are available.
cat >> $path_bashrc <<- EOM

# ----------------------------------------------------------------------
# CASPER - NCTL
# ----------------------------------------------------------------------

# Path to local casper-node repo.
NCTL_CASPER_HOME=$path_casper_node

# Set daemon process to use.
NCTL_DAEMON_TYPE=systemd

# Activate nctl shell.
source ${path_nctl_install}/nctl/activate

EOM