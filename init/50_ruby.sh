# Full installation only
[ "$(get_install_type)" -lt "1" ] && return 1

# Install rbenv
if [[ "$(type -p rbenv)" ]]; then
  recipes=( rbenv )
  brew_install_recipes
  eval "$(rbenv init -)"
  source $HOME/.bash_profile
fi

# Set default gems to install
printf "tmuxinator" > $(rbenv root)/default-gems

# Ruby versions to install
latest=$(rbenv install -l | grep '^\s*\d\+\.\d\+\.\d\+$' | tail -n 1 | xargs)
versions=( $latest )

# Don't install versions already installed
rubies=($(setdiff "${versions[*]}" "$(rbenv whence ruby)"))

# Install rubies
if (( ${#rubies[@]} > 0 )); then
  e_header "Installing Ruby versions: ${rubies[*]}"
  for r in "${rubies[@]}"; do
    rbenv install "$r"
    [[ "$r" == "${versions[0]}" ]] && rbenv global "$r"
  done
fi

