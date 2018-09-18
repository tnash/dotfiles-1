# Backups, swaps and undos are stored here.
mkdir -p $DOTFILES/caches/vim

# Install vim plugins
vim +PlugInstall +qall

# Compile YouCompleteMe
# if [ ! -e ~/.vim/plugged/YouCompleteMe/python/ycm/youcompleteme.pyc ]; then
#   pushd ~/.vim/plugged/YouCompleteMe
#   ./install.py --clang-completer
#   popd
# fi

if [ "$(get_install_type)" -gt "0" ]; then

  pushd $HOME
  curl -SLO http://mirror.cc.columbia.edu/pub/software/eclipse/technology/epp/downloads/release/neon/2/eclipse-java-neon-2-linux-gtk-x86_64.tar.gz
  tar -zxvf *.tar.gz
  popd

  if [ ! -e $HOME/eclipse/eclim ]; then

    # Install eclim
    pushd /tmp
    wget "https://github.com/ervandew/eclim/releases/download/2.6.0/eclim_2.6.0.jar"
    java \
      -Dvim.files=$HOME/.vim \
      -Declipse.home=$HOME/eclipse \
      -jar eclim_2.6.0.jar install
    popd
  fi

fi
