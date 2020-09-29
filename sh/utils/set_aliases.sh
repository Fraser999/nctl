# Assets.
alias nctl-assets-dump='source $NCTL/sh/assets/dump.sh'
alias nctl-assets-ls='source $NCTL/sh/assets/list.sh'
alias nctl-assets-setup='source $NCTL/sh/assets/setup.sh'
alias nctl-assets-teardown='source $NCTL/sh/assets/teardown.sh'

# Compilation.
alias nctl-compile='source $NCTL/sh/compile/all.sh'
alias nctl-compile-client='source $NCTL/sh/compile/client.sh'
alias nctl-compile-node='source $NCTL/sh/compile/node.sh'

# Workload Generators.
alias nctl-wg-100='source $NCTL/sh/generators/wg_100.sh'
alias nctl-wg-110='source $NCTL/sh/generators/wg_110.sh'

# Logs.
alias nctl-log-reset='source $NCTL/sh/node/log_reset.sh'
alias nctl-log-view='source $NCTL/sh/node/log_view.sh'

# Node.
# alias nctl-down='source $NCTL/sh/node/down.sh'
alias nctl-interactive='source $NCTL/sh/node/interactive.sh'
alias nctl-restart='source $NCTL/sh/node/restart.sh'
alias nctl-start='source $NCTL/sh/node/start.sh'
alias nctl-status='source $NCTL/sh/node/status.sh'
alias nctl-stop='source $NCTL/sh/node/stop.sh'
alias nctl-toggle='source $NCTL/sh/node/toggle.sh'
# alias nctl-up='source $NCTL/sh/node/start.sh'

# State views.
# alias nctl-view-account='source $NCTL/sh/views/view_account.sh'
alias nctl-view-metrics='source $NCTL/sh/views/view_metrics.sh'
alias nctl-view-status='source $NCTL/sh/views/view_status.sh'
