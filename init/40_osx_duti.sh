# OSX-only stuff. Abort if not OSX.
is_osx || return 1

duti -s `bid Sublime` .sh all
duti -s `bid Sublime` .md all
duti -s `bid Sublime` .txt all
duti -s `bid Sublime` .conf all
duti -s `bid Sublime` .rb all
duti -s `bid Sublime` .coffee all
duti -s `bid Sublime` .sublime-workspace all
duti -s `bid Sublime` .sublime-project all

