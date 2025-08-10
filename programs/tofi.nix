{lib}: {
  enable = true;
  settings = {
    width = "100%";
    height = "100%";
    border-width = 0;
    outline-width = 0;
    padding-left = "35%";
    padding-top = "35%";
    result-spacing = 25;
    num-results = 5;
    font = lib.mkForce "FiraCode";
    font-size = lib.mkForce 16;
    background-color = lib.mkForce "#000A";
  };
}
