# OSX-only stuff. Abort if not OSX.
is_osx || return 1

duti -s `bid Sublime` .sh all
duti -s `bid Sublime` .md all
duti -s `bid Sublime` .txt all
duti -s `bid SUblime` .conf all