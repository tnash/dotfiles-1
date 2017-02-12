# Full installation only
[ "$(get_install_type)" -lt "1" ] && return 1

source $DOTFILES/source/50_ruby.sh

# Install Ruby
if [[ "$(type -P rbenv)" ]]; then

  # Ruby versions to install
  local l0=( 2.2.2 )
  local l1=()

  # Compile array of versions to install based on installation level
  for i in $(seq "$(get_install_type)" -1 0); do
    eval arr=("\${"l"$i[@]}")
    versions=("${versions[@]}" "${arr[@]}")
  done

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
fi

#
# Gems
#

if [[ "$(type -P gem)" ]]; then

  l0=(
    tmuxinator
  )

  l1=(
    knife-solo_data_bag
  )

  # Compile array of gems to install based on installation level
  for i in $(seq "$(get_install_type)" -1 0); do
    eval arr=("\${"l"$i[@]}")
    gems=("${gems[@]}" "${arr[@]}")
  done

  # Install gems
  if (( ${#gems[@]} > 0 )); then
    e_header "Installing gems: ${gems[*]}"
    for gem in "${gems[@]}"; do
      gem install "${gem}"
    done
  fi

fi

