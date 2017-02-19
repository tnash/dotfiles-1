# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export GREP_OPTIONS='--color=auto'

# Recursive grep with colors
function grepr() {
  grep --color=always -R "$@" | less
}

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
  complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
fi

# thefuck
eval $(thefuck --alias)

# tmux
function tmux_kill() { 
  tmux kill-session -t "$1" 
}
function tmux_attach() { 
  tmux attach -t "$1" 
}
alias tk="tmux_kill"
alias tl="tmux ls"
alias ta="tmux_attach"

# eclim
export PATH
PATH="$(path_remove /Applications/Eclipse.app/Contents/Eclipse):/Applications/Eclipse.app/Contents/Eclipse"

# python
PATH=$PATH:$HOME/Library/Python/2.7/bin
