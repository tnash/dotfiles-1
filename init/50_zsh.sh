if [ ! -e "$HOME/.oh-my-zsh" ]; then
  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Re-symlink .zshrc because the installer overwrites it
  ln -sf $DOTFILES/link/.zshrc $HOME/.zshrc

  # Install powerlevel9k
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi
