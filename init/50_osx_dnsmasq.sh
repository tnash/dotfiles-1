# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if already linked
[ $DOTFILES/conf/osx/dnsmasq/dnsmasq.conf -ef $(brew --prefix)/etc/dnsmasq.conf ] && return 1

# Back up original 
[ -e $(brew --prefix)/etc/dnsmasq.conf ] && [ -f $(brew --prefix)/etc/dnsmasq.conf ] && mv $(brew --prefix)/etc/dnsmasq.conf $(brew --prefix)/etc/dnsmasq.conf.orig

# Symlink the config
ln -sf $DOTFILES/conf/osx/dnsmasq/dnsmasq.conf $(brew --prefix)/etc/dnsmasq.conf

# Create launch daemon and start dnsmasq
[ -f $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist ] && sudo ln -sfv $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons/
[ -e /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist ] && sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
[ -e /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist ] && sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist