# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if already configured
[ -e ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist ] && return 1

# Create launch agent and start mysql
# http://echo.co/blog/os-x-109-local-development-environment-apache-php-and-mysql-homebrew
[ ! -d ~/Library/LaunchAgents ] && mkdir -v ~/Library/LaunchAgents
[ -f $(brew --prefix mysql)/homebrew.mxcl.mysql.plist ] && ln -sfv $(brew --prefix mysql)/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/
[ -e ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist ] && launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

$(brew --prefix mysql)/bin/mysql_secure_installation