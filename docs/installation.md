# NCTL installation

### Step 0 - pre-requisites.

1. python3 + pip3.   
2. The casper-node software (https://github.com/CasperLabs/casper-node) installed into YOUR_WORKING_DIRECTORY & sucessfully compiled.

### Step 1 - install pre-requisites.

```
python3 -m pip install supervisor
```

### Step 2 - install source.

```
cd YOUR_WORKING_DIRECTORY
git clone https://github.com/CasperLabs/nctl.git
```

### Step 3 - set local setup file

```
cat >> $HOME/.casper-nctl <<- EOM

# Path to local casper-node repo.
export NCTL_CASPER_HOME=$(pwd)/casper-node

# Activate nctl shell.
. $(pwd)/nctl/activate

EOM
```

### Step 4 - extend bashrc file to make nctl commands available from terminal session.

```
cat >> $HOME/.bashrc <<- EOM

# ----------------------------------------------------------------------
# CASPER - NCTL
# ----------------------------------------------------------------------

# Activate nctl shell.
. $HOME/.casper-nctl

EOM
```

### Step 5 - activate nctl shell.

```
. $HOME/.casper-nctl
```
