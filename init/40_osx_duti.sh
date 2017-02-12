# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Full installation only
[ "$(get_install_type)" -lt "1" ] && return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

recipes=( "duti" )
brew_install_recipes

if [[ ! "$(bid Sublime)" =~ "not found" ]]; then
  duti -s `bid Sublime` .sh all
  duti -s `bid Sublime` .md all
  duti -s `bid Sublime` .txt all
  duti -s `bid Sublime` .conf all
  duti -s `bid Sublime` .rb all
  duti -s `bid Sublime` .coffee all
  duti -s `bid Sublime` .sublime-workspace all
  duti -s `bid Sublime` .sublime-project all
fi
