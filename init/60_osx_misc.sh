# OSX-only stuff. Abort if not OSX.
is_osx || return 1

if [[ "$(type -p pip3)" ]]; then
  pip3 install --user powerline-status
  pip3 install psutil
fi
