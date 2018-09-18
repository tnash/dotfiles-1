# OSX-only stuff. Abort if not OSX.
is_osx || return 1

curl -fLso "$HOME/Library/Fonts/Sauce Code Pro Medium Nerd Font Complete.ttf" "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Medium/complete/Sauce%20Code%20Pro%20Medium%20Nerd%20Font%20Complete.ttf?raw=true"

curl -fLso "$HOME/Library/Fonts/Inconsolata Nerd Font Complete.otf" "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete.otf?raw=true"

