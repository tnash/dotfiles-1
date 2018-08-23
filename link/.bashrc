# Where the magic happens.
export DOTFILES=$HOME/.dotfiles

# Add binaries into the path
export PATH=$DOTFILES/bin:$PATH

# Source all files in "source"
function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
