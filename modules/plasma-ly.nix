{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.ly = {
    enable = true;
    settings = {
      clear_password = true;
      lang = "nl";
      numlock = true;

    };
  };

  environment.etc."ly/lang/nl.ini".source = ./../.dotfiles/ly/nl.ini;

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    discover
    okular
    qrca
  ];

  environment.etc."xdg/kcminputrc".text = ''
    [Keyboard]
    NumLock=0
  '';
}
