#!/bin/zsh
mkdir -pv ~/.config; stow -v neovim
stow -v git
stow -v nix-darwin
stow -v zsh
stow -v tmux
mkdir -pv ~/code; stow -v project-scripts
stow -v alacritty
