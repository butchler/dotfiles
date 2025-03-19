{
  allowUnfree = true;
  allowUnsupportedSystem = true;

  #permittedInsecurePackages = [
    #"xpdf-4.03"
  #];

  # Based on https://nixos.org/manual/nixpkgs/stable/#sec-declarative-package-management
  /*
  let
    nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/8c9fd3e564728e90829ee7dbac6edc972971cd0f.tar.gz";
    pkgs = import nixpkgs { config = {}; overlays = []; };
  in

  packageOverrides = pkgs: with pkgs; {
    myProfile = writeText "my-profile" ''
      export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin
      export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
    '';
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        (runCommand "profile" {} ''
          mkdir -p $out/etc/profile.d
          cp ${myProfile} $out/etc/profile.d/my-profile.sh
        '')
        silver-searcher
        ripgrep
        fzf
        htop
        jq
        yq
        unzip
        wget
        colordiff
        coreutils-prefixed
        gitAndTools.diff-so-fancy
        gitFull
        git-lfs
        nix-bash-completions
        nix-zsh-completions
        rename
        rsync
        tree
        neovim
        neovim-remote
        tmux
        yarn
        nodejs
        bundix
        ruby
        rubocop
        #phraseapp_updater
        alacritty
        stow
        watchman
      ];
      pathsToLink = [ "/share/man" "/share/doc" "/bin" "/Applications" ];
      extraOutputsToInstall = [ "man" "doc" ];
    };
  };
  */
}
