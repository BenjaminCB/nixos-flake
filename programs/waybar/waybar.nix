{
  enable = true;
  style = ./style.css;
  settings = builtins.fromJSON (builtins.readFile ./config.jsonc);
}
