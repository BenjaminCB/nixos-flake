{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "xwaylandvideobridge";
  # version = "unstable-2023-03-28";

  src = pkgs.fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "davidedmundson";
    repo = "xwaylandvideobridge";
    rev = "b876b5f3ee5cc810c99b08e8f0ebb29553e45e47";
    hash = "sha256-gfQkOIZegxdFQ9IV2Qp/lLRtfI5/g6bDD3XRBdLh4q0=";
  };

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.extra-cmake-modules
    pkgs.pkg-config
  ];

  buildInputs = [
    pkgs.qt5.qtbase
    pkgs.qt5.qtquickcontrols2
    pkgs.qt5.qtx11extras
    pkgs.libsForQt5.kdelibs4support
    (pkgs.libsForQt5.kpipewire.overrideAttrs (oldAttrs: {
      # version = "unstable-2023-03-28";

      src = pkgs.fetchFromGitLab {
        domain = "invent.kde.org";
        owner = "plasma";
        repo = "kpipewire";
        rev = "ed99b94be40bd8c5b7b2a2f17d0622f11b2ab7fb";
        hash = "sha256-KhmhlH7gaFGrvPaB3voQ57CKutnw5DlLOz7gy/3Mzms=";
      };
    }))
  ];

  dontWrapQtApps = true;
}
