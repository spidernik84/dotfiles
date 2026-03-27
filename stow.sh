# Rerun this whenever there are new files in dotfiles directory
# assumes command is being run from $HOME/env, where this repo should be
stow --verbose=3 --dotfiles -t ~/.config/ dotfiles
