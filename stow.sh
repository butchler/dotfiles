#!/bin/zsh
mkdir -pv ~/code
mkdir -pv ~/.config; stow -v neovim
stow -v git
stow -v nix-darwin
stow -v zsh
stow -v tmux
stow -v alacritty
