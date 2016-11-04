# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Homebrew recipes
recipes=(
  awscli
  cocoapods
  duti
  git
  git-extras
  icdiff
  lesspipe
  rbenv
  ssh-copy-id
  tmux
  tree
  wget
  zsh
)

brew_install_recipes