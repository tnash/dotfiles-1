# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Install vim plugins
vim +PlugInstall +qall
