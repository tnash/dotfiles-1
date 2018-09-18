# Dotfiles

My OSX / Ubuntu dotfiles

## Features

- Easy install clone the repo, navigate to the repo base directory and run ./bin/dotfiles
- Multiple installation levels: get up-and-running quickly or enjoy the full
  feature set
- Selectable features
- Installs and configures tools/apps:
  - [homebrew](https://brew.sh)
  - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) - zsh
  - [fzf](https://github.com/junegunn/fzf) - fuzzy everything for shell and vim
  - [iterm2](https://iterm2.com) - terminal emulator
  - [nave](https://github.com/isaacs/nave) - nodejs version manager
  - [rbenv](https://github.com/rbenv/rbenv) - ruby version manager
  - [vim](https://github.com/macvim-dev/macvim) - the only real editor
  - [tmux](https://github.com/tmux/tmux) - tmux + vim = ide
  - [powerline](https://powerline.readthedocs.io/en/master/) - status line for zsh and tmux
  - many more! [recipes](init/30_osx_homebrew_recipes.sh),
    [casks](init/30_osx_homebrew_casks.sh)
- Downloads, decrypts, and installs ssh keys from Dropbox

## Overview

My dotfiles were originally forked from [Ben Alman's
dotfiles](https://github.com/cowboy/dotfiles), most of which I didn't understand
at the time, but it was a great starting point, and I like the framework he
created for installing and managing dotfiles. Since then I've gone through a
couple of major rewrites where I added things like multiple installation levels
and fetching ssh keys from Dropbox. Most recently I cleaned up everything I did
not use or like and rewrote my shell, tmux, and vim configs. I finally consider
the dotfiles to be my own, based on Ben Alman's framework.

For details on how the framework works, refer to [Ben Alman's
dotfiles](https://github.com/cowboy/dotfiles).

## TODO
Add a link to mate to run TextMate from command line:
ln -s /Applications/TextMate.app/Contents/Resources/mate ~/bin/mate

