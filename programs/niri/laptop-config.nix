let
  monitorConfig = import ./laptop-monitor-config.nix;
  niriConfig = import ./config.nix {inherit monitorConfig;};
in {
  home.file.niri = {
    enable = true;
    recursive = true;
    text = niriConfig;
    target = ".config/niri/config.kdl";
  };
}
