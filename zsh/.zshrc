# Based on https://nixos.org/manual/nixpkgs/stable/#sec-declarative-package-management
#if [ -d "${HOME}/.nix-profile/etc/profile.d" ]; then
  #for i in "${HOME}/.nix-profile/etc/profile.d/"*.sh; do
    #if [ -r "$i" ]; then
      #. "$i"
    #fi
  #done
#fi

alias ls='ls -FG'

export EDITOR='nvim'

export PATH=$PATH:$HOME/code/lsp/node_modules/.bin
