# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Check if plugin exists already
vagrant plugin list | grep vagrant-dnsmasq
[ $? -eq 0 ] && return 1

vagrant plugin install vagrant-dnsmasq