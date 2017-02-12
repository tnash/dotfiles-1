# OSX-only stuff. Abort if not OSX.
is_osx || return 1

pushd ~/Library/Fonts
curl -fLso "Sauce Code Pro Medium Nerd Font Complete.ttf" "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Medium/complete/Sauce%20Code%20Pro%20Medium%20Nerd%20Font%20Complete.ttf?raw=true"
popd

