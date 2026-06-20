{ config, pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "librewolf-151.0.2-1"
    "librewolf-unwrapped-151.0.2-1"
  ];

  environment.systemPackages = with pkgs; [
    vim
    git
    tree
    (discord.override {
      withVencord = true;
    })
    ruby
    man
    kitty
    librewolf
    input-remapper
    lunar-client
    vlc
    r2modman
    wineWow64Packages.full
    dxvk
    protonplus
    cider-2
    openssh
    xfsprogs
    fastfetch
    pciutils
    mesa-demos
    opentabletdriver
    xclicker
    osu-lazer-bin
    kdePackages.ark
    unrar
    irssi
    mangohud
    hyfetch
    vscodium
  ];
}