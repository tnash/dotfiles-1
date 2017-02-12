# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='mvim -v'
  export LESSEDIT='mvim ?lm+%lm -- %f'
  alias vim="$EDITOR"
  alias vi="$EDITOR"
else
  export EDITOR='vim'
fi

export VISUAL="$EDITOR"
alias q="$EDITOR"
alias qv="q $DOTFILES/link/.{,g}vimrc +'cd $DOTFILES'"
alias qs="q $DOTFILES"
