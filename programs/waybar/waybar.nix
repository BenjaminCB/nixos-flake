{lib}: {
  enable = true;
  style = lib.mkForce ./style.css;
  systemd.enable = true;
  settings.mainBar = builtins.fromJSON (builtins.readFile ./config.jsonc);
}
