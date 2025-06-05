{ config, pkgs, zen-browser, ghostty, system, lib, ... }:
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

  # Theming: Catppuccin
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.11";
}
