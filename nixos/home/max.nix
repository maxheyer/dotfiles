{ config, pkgs, zen-browser, ghostty, system, lib, ... }:
  let
  dotfilesRepo = pkgs.fetchFromGitHub {
    owner = "maxheyer";
    repo = "dotfiles";
    rev = "master";
    sha256 = "sha256-Zayhv/k3erBq+YBWdE12Bm9Bs2sei8uJvCxfMAHFp+Q=";
  };
  nvimConfig = "${dotfilesRepo}/configs/nvim";
in
{

  home.username = "max";
  home.homeDirectory = "/home/max";

  programs.home-manager.enable = true;

  # Shell
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      zoxide init fish | source
    '';
  };
  home.file.".config/nvim" = {
    source = nvimConfig;
    recursive = true;
  };

  # Tools
  home.packages = with pkgs; [
    home-manager
    zoxide
    bat
    eza
    ripgrep
    fd
    neovim
    git
    curl
    wget
    unzip
    btop
    jq
    lazygit
    tree
    zen-browser.packages.${system}.default
    ghostty.packages.${system}.default
    discord-ptb
    fzf
    ripgrep
  ];

  # Git config
  programs.git = {
    enable = true;
    userName = "Max Heyer";
    userEmail = "mail@max.gp";
    aliases = {
      co = "checkout";
      s = "status";
      ci = "commit";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.11";
}
