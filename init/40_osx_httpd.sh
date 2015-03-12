# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if already linked
[ $DOTFILES/conf/osx/httpd/httpd.conf -ef $(brew --prefix)/etc/apache2/2.4/httpd.conf ] && [ $DOTFILES/conf/osx/httpd/httpd-vhosts.conf -ef $(brew --prefix)/etc/apache2/2.4/extra/httpd-vhosts.conf ] && return 1

# Stop Apple's version
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

# Backup originals
[ -e $(brew --prefix)/etc/apache2/2.4/httpd.conf ] && [ -f $(brew --prefix)/etc/apache2/2.4/httpd.conf ] && mv $(brew --prefix)/etc/apache2/2.4/httpd.conf $(brew --prefix)/etc/apache2/2.4/httpd.conf.orig
[ -e $(brew --prefix)/etc/apache2/2.4/extra/httpd-vhosts.conf ] && [ -f $(brew --prefix)/etc/apache2/2.4/extra/httpd-vhosts.conf ] && mv $(brew --prefix)/etc/apache2/2.4/extra/httpd-vhosts.conf $(brew --prefix)/etc/apache2/2.4/extra/httpd-vhosts.conf.orig

# Symlink the config
sudo ln -sf $DOTFILES/conf/osx/httpd/httpd.conf $(brew --prefix)/etc/apache2/2.4/httpd.conf
sudo ln -sf $DOTFILES/conf/osx/httpd/httpd-vhosts.conf $(brew --prefix)/etc/apache2/2.4/extra/httpd-vhosts.conf

# Create launch agent and start httpd
# http://echo.co/blog/os-x-109-local-development-environment-apache-php-and-mysql-homebrew
[ -f $(brew --prefix httpd24)/homebrew.mxcl.httpd24.plist ] && sudo ln -sfv $(brew --prefix httpd24)/homebrew.mxcl.httpd24.plist /Library/LaunchDaemons/
[ -e /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist ] && sudo chown root /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
[ -e /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist ] && sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist