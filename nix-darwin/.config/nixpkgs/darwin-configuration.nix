{ config, pkgs, ... }:

{
  # Configure nixpkgs overlays (additional software packages)
  nixpkgs.overlays = [
    (import ./overlays/packages.nix)
  ];

  # Configure custom Darwin modules (service configuration).
  imports = [
    <iknow/darwin-modules>
    ((builtins.getEnv "HOME") + "/code/eikaiwa_content/nix/darwin-config.nix")
  ];

  # Configure packages to be installed. Packages can be searched by name with:
  # $ nix-env -qaP | grep <packagename>
  environment.systemPackages =
    with pkgs; [
      ag
      ripgrep
      fzf
      htop
      jq
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
      phraseapp_updater
      lorri
      #cloc
      #qpdf
      #xpdf
      alacritty
    ];

  # Enable Eikaiwa services (postgres, elasticsearch, kibana memcached, redis)
  eikaiwa.services = {
    enable = true;
    # Configure PostgreSQL to run faster but with less safety in
    # the event of a crash. Disable if storing useful data.
    postgresql.fastUnsafe = true;
  };

  # Run a lorri daemon
  services.lorri.enable = true;

  # Use a custom configuration.nix location. Switch to new location by running once
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin-configuration.nix
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin-configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 8;
  nix.buildCores = 0;

  nix.nixPath = [
    "nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs" # NixOS/nix#1865
  ];

  nixpkgs.config = import ./config.nix;

  # === Additional config ===

  # Use neovim as default editor
  environment.variables.EDITOR = "nvim";

  # Disabling automatic GC because even with lorri it seems like it might be
  # deleting things that are still being used by the project shell.nix files.
  #nix.gc = {
    #automatic = true;
    #interval = { Weekday = 1; Hour = 3; Minute = 15; };
    #options = "--delete-older-than 14d";
  #};

  # Local DNS server for testing local frontend on mobile devices:
  # https://github.com/iknow/wiki/wiki/Setting-up-dnsmasq-to-access-dev-environment-from-other-devices
  services.dnsmasq = {
    enable = true;
    bind = "0.0.0.0";
  };

  environment.etc."dnsmasq.conf" = {
    text = ''
      domain-needed
      bogus-priv

      no-resolv

      server = 1.1.1.1
      server = 1.0.0.1

      address=/devdomain.name/192.168.0.160
    '';
  };
}
