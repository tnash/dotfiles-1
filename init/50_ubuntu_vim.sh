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

  # The download is currently corrupt...install manually

  # pushd /tmp
  # curl -so "eclipse.tar.gz" "https://www.eclipse.org/downloads/download.php?file=/oomph/epp/neon/R2a/eclipse-inst-linux64.tar.gz"
  # tar -zxvf eclipse.tar.gz
  # eclipse-installer/eclipse-inst
  # popd

  if [ ! -e $HOME/java-neon/eclipse/eclim ]; then

    # Install eclim
    pushd /tmp
    wget "https://github.com/ervandew/eclim/releases/download/2.6.0/eclim_2.6.0.jar"
    java \
      -Dvim.files=$HOME/.vim \
      -Declipse.home=$HOME/java-neon/eclipse \
      -jar eclim_2.6.0.jar install
    popd
  fi

fi
