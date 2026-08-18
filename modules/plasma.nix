{ pkgs, ... }:

let
  sddm-xsetup = pkgs.writeShellScript "sddm-xsetup" ''
    ${pkgs.xrandr}/bin/xrandr --output DP-3 --off || true
  '';

  sddm-wallpaper = pkgs.stdenvNoCC.mkDerivation {
    name = "lain-sddm-wallpaper";
    src = /etc/nixos/.dotfiles/sddm/lain.jpg;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out
      cp $src $out/lain.jpg
    '';
  };

  breeze-user-config = pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
    [General]
    background="${sddm-wallpaper}/lain.jpg"
  '';
in
{
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = "breeze";

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
    breeze-user-config
  ];

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
