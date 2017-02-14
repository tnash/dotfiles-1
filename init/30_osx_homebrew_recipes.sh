# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Homebrew recipes
l0=(
  cmake
  ctags
  git
  git-extras
  icdiff
  jq
  lesspipe
  macvim
  maven
  reattach-to-user-namespace
  ssh-copy-id
  thefuck
  tmux
  tree
  wget
)

l1=(
  awscli
  cocoapods
  mysql
  nodejs
  the_silver_searcher
  zsh
)

# Compile array of casks to install based on installation level
for i in $(seq "$(get_install_type)" -1 0); do
  eval arr=("\${"l"$i[@]}")
  recipes=("${recipes[@]}" "${arr[@]}")
done

brew_install_recipes
