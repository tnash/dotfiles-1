# OSX-only stuff. Abort if not OSX.
is_osx || return 1

vagrant plugin install vagrant-dnsmasq