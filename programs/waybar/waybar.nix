{
  lib,
  pkgs,
}: let
  toggleSink = pkgs.writeShellScriptBin "wpctl-toggle-sink" ''
    set -euo pipefail
    WPCTL=${pkgs.wireplumber}/bin/wpctl
    AWK=${pkgs.gawk}/bin/awk
    TR=${pkgs.coreutils}/bin/tr
    NOTIFY=${pkgs.libnotify}/bin/notify-send

    # Collect sink IDs
    mapfile -t sinks < <(''$WPCTL status \
      | ''$AWK '/Sinks:/{flag=1;next}/Sources:/{flag=0}flag && /ID/{gsub(/\./,"",''$2); print ''$2}')

    if (( ''${#sinks[@]} == 0 )); then
      ''$NOTIFY "Audio" "No sinks found"
      exit 0
    fi

    current=''$(''$WPCTL status | ''$AWK '/Default Sink/{gsub(/\./,"",''$3); print ''$3}')
    # Find current in list, then pick next (wrap around)
    next=""
    for i in "''${!sinks[@]}"; do
      if [[ "''${sinks[''$i]}" = "''$current" ]]; then
        next_index=$(( (''$i + 1) % ''${#sinks[@]} ))
        next=''${sinks[''$next_index]}
        break
      fi
    done
    [[ -z "''$next" ]] && next=''${sinks [0]}

    ''$WPCTL set-default "''$next"
    ''$NOTIFY "Audio" "Default output → ID ''$next"
  '';

  toggleSource = pkgs.writeShellScriptBin "wpctl-toggle-source" ''
    set -euo pipefail
    WPCTL=${pkgs.wireplumber}/bin/wpctl
    AWK=${pkgs.gawk}/bin/awk
    TR=${pkgs.coreutils}/bin/tr
    NOTIFY=${pkgs.libnotify}/bin/notify-send

    # Collect source IDs
    mapfile -t srcs < <(''$WPCTL status \
      | ''$AWK '/Sources:/{flag=1;next}/Streams:/{flag=0}flag && /ID/{gsub(/\./,"",''$2); print ''$2}')

    if (( ''${#srcs[@]} == 0 )); then
      ''$NOTIFY "Audio" "No sources found"
      exit 0
    fi

    current=''$(''$WPCTL status | ''$AWK '/Default Source/{gsub(/\./,"",''$3); print ''$3}')
    next=""
    for i in "''${!srcs[@]}"; do
      if [[ "''${srcs[''$i]}" = "''$current" ]]; then
        next_index=$(( (''$i + 1) % ''${#srcs[@]} ))
        next=''${srcs[''$next_index]}
        break
      fi
    done
    [[ -z "''$next" ]] && next=''${srcs[0]}

    ''$WPCTL set-default "''$next"
    ''$NOTIFY "Audio" "Default input → ID ''$next"
  '';
in {
  enable = false;
  style = lib.mkForce ./style.css;
  systemd.enable = true;
  settings.mainBar = {
    position = "bottom";
    layer = "top";
    "modules-left" = ["wlr/workspaces"];
    "modules-center" = ["clock"];
    "modules-right" = ["pulseaudio" "network" "bluetooth" "tray"];

    pulseaudio = {
      format = "{icon} {volume}%";
      "format-muted" = " {volume}%";
      "on-click" = ''${toggleSink}''; # cycle outputs
      "on-click-right" = ''${toggleSource}''; # cycle inputs
      "scroll-step" = 5;
    };

    network = {
      "format-wifi" = " {essid} {signalStrength}%";
      "format-ethernet" = "󰈀 {ipaddr}";
      "format-disconnected" = "󰤭";
      tooltip = true;
    };

    bluetooth = {
      format = "";
      "format-connected" = " {num_connections}";
      "on-click" = ''${pkgs.blueman}/bin/blueman-applet'';
    };

    tray = {
      "icon-size" = 16;
      spacing = 8;
    };
  };
}
