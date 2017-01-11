# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# Install rbenv
if [ ! -d ~/.rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_rc

  # Install ruby-build for rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi