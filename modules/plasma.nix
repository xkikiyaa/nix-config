{ pkgs, ... }:

let
  sddm-xsetup = pkgs.writeShellScript "sddm-xsetup" ''
    ${pkgs.xrandr}/bin/xrandr --output DP-3 --off || true
  '';
in
{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;

    settings = {
      General = {
        DisplayServer = "x11";
      };

      X11 = {
        DisplayCommand = "${sddm-xsetup}";
      };
    };

    extraPackages = with pkgs; [
      xrandr
    ];
  };

  environment.systemPackages = with pkgs; [
    xrandr
  ];

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    discover
    okular
    qrca
    kate
  ];

  environment.etc."xdg/kcminputrc".text = ''
    [Keyboard]
    NumLock=0
  '';
}
