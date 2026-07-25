{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.ly = {
    enable = true;
    settings = {
      numlock = true;
      lang = "nl";
    };
  };

  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    ly
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    discover
    okular
    qrca
    kate
  ];
}
