{ config, pkgs, ... }:

let
  dotfiles = ./.dotfiles;
in
{
  home.username = "lesley";
  home.homeDirectory = "/home/lesley";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.file.".config/kitty".force = true;

  home.file.".config/neofetch".source =
    dotfiles + "/neofetch";

  home.file.".scripts/seija" = {
    source = dotfiles + "/seija/seija";
    executable = true;};

  home.file.".config/kitty".source =
    dotfiles + "/kitty";

  home.file = {
    ".config/ly/nl.ini".source =
    /etc/nixos/.dotfiles/ly/nl.ini;
};


  programs.bash = {
  enable = true;

  shellAliases = {
    update = "sudo nixos-rebuild switch --upgrade";
    clean = "sudo nix-collect-garbage -d";
    list = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
  };

  initExtra = ''
    PS1="\[\e[38;2;194;246;255m\][\u@\h:\w]\\$\[\e[0m\] "

    if command -v hyfetch >/dev/null; then
      hyfetch
    fi
  '';
};
}
