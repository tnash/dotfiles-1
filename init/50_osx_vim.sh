# Backups, swaps and undos are stored here.
mkdir -p $DOTFILES/caches/vim

# Install vim plugins
vim +PlugInstall +qall

# Compile YouCompleteMe
if [ ! -e ~/.vim/plugged/YouCompleteMe/python/ycm/youcompleteme.pyc ]; then
  pushd ~/.vim/plugged/YouCompleteMe
  ./install.py --clang-completer
  popd
fi

if [ "$(get_install_type)" -gt "0" ]; then

  # Install eclipse
  casks=( "eclipse-ide" )
  brew_install_casks

  if [ ! -e /Applications/Eclipse.app/Contents/Eclipse/eclim ]; then

    # Install eclim
    pushd /tmp
    wget "https://github.com/ervandew/eclim/releases/download/2.6.0/eclim_2.6.0.jar"
    java \
      -Dvim.files=$HOME/.vim \
      -Declipse.home=/Applications/Eclipse.app/Contents/Eclipse \
      -jar eclim_2.6.0.jar install
    popd
  fi

fi
