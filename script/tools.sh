#!/bin/bash
set -ex

SUDO=sudo

$SUDO apt -y update
$SUDO apt -y full-upgrade
$SUDO apt -y install mc tmux emacs-nox rsync wget

cat >> ~/.bashrc<<'EOF'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

alias tm='tmux attach -d -t main'
alias tmn='tmux new -s main'
alias sudo='sudo '

export EDITOR="emacs -nw"
alias e=$EDITOR

if [[ $TERM == "xterm-256color" ]]; then
    export TERM=xterm-color
fi

shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a;"

EOF

#emacs adds extra tabs when pasting into it. That will fix it.
cat >> ~/.emacs<<'EOF'
(electric-indent-mode 0)
EOF

cat >> ~/.profile<<'EOF'
export EDITOR="emacs -nw"
export HISTSIZE=50000
export HISTFILESIZE=1000000
EOF


cat > ~/.tmux.conf<<'EOF'
set-option -g prefix C-a
bind-key C-a last-window
set -g base-index 1
set -s escape-time 0
set-option -g history-limit 200000
set-window-option -g xterm-keys on
set -g mouse off
EOF

export PATH=$PATH:.
