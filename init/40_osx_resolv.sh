# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if already configured
[ -e /etc/resolver/dev ] && return 1

# Create /etc/resolver if needed
[ ! -d /etc/resolver ] && sudo mkdir -p /etc/resolver

# Create dev resolver
sudo tee /etc/resolver/dev >/dev/null <<EOF
nameserver 127.0.0.1
EOF