# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if already linked
[ $DOTFILES/conf/osx/dnsmasq/dnsmasq.conf -ef $(brew --prefix)/etc/dnsmasq.conf ] && return 1

# Back up original 
[ -e $(brew --prefix)/etc/dnsmasq.conf ] && [ -f $(brew --prefix)/etc/dnsmasq.conf ] && mv $(brew --prefix)/etc/dnsmasq.conf $(brew --prefix)/etc/dnsmasq.conf.orig

# Symlink the config
ln -sf $DOTFILES/conf/osx/dnsmasq/dnsmasq.conf $(brew --prefix)/etc/dnsmasq.conf

# Start dnsmasq at startup
sudo cp -fv $(brew --prefix dnsmasq)/*.plist ~/Library/LaunchAgents
sudo chown root ~/Library/LaunchAgents/homebrew.mxcl.dnsmasq.plist

# Start now
sudo launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.dnsmasq.plist