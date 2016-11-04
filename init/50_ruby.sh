# Configure and initialize rbenv
rbenv init
echo "eval \"$(rbenv init -)\"" >> ~/.zshrc
$(eval "$(rbenv init -)")

# Install Ruby
if [[ "$(type -P rbenv)" ]]; then
  versions=(2.2.2)

  rubies=($(setdiff "${versions[*]}" "$(rbenv whence ruby)"))
  if (( ${#rubies[@]} > 0 )); then
    e_header "Installing Ruby versions: ${rubies[*]}"
    for r in "${rubies[@]}"; do
      rbenv install "$r"
      [[ "$r" == "${versions[0]}" ]] && rbenv global "$r"
    done
  fi
fi

# Install gems
gem install bundler
gem install builder
chef gem install knife-ec2
chef gem install knife-solo
gem install knife-solo_data_bag
gem install tmuxinator
