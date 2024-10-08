{ pkgs, monitorSetup }:

{
    enable = true;
    settings = monitorSetup // {
        exec-once = [
            "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        ];

        input = {
            kb_layout = "us";
            kb_variant = "";
            kb_model = "";
            kb_options = "";
            kb_rules = "";

            follow_mouse = 1;

            touchpad = {
                natural_scroll = "no";
            };

            sensitivity = 0;
        };

        windowrulev2 = [
            "tile,title:File Upload"
        ];

        general = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more

            gaps_in = 5;
            gaps_out = 5;
            border_size = 2;

            layout = "master";
        };

        decoration = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more

            rounding = 10;

            drop_shadow = "yes";
            shadow_range = 4;
            shadow_render_power = 3;
        };

        animations = {
            enabled = "yes";

            # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

            animation = [
                "windows, 1, 7, myBezier"
                "windowsOut, 1, 7, default, popin 80%"
                "border, 1, 10, default"
                "borderangle, 1, 8, default"
                "fade, 1, 7, default"
                "workspaces, 1, 6, default, slidevert"
            ];
        };

        dwindle = {
            # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
            pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = "yes"; # you probably want this
        };

        master = {
            # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
            new_status = "master";
        };

        gestures = {
            # See https://wiki.hyprland.org/Configuring/Gestures/ for more
            workspace_swipe = "off";
        };

        "$mainMod" = "SUPER";

        bind = [
            # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
            "$mainMod, T, exec, kitty"
            "$mainMod, F, exec, firefox"
            "$mainMod, Q, killactive,"
            "$mainMod, R, exec, tofi-drun --drun-launch=true"
            "$mainMod, G, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.swappy}/bin/swappy -f -"

            # Move focus with mainMod + [HL]
            "$mainMod, H, layoutmsg, cycleprev"
            "$mainMod, L, layoutmsg, cyclenext"
            "$mainMod, M, fullscreen"
            "$mainMod, B, fullscreenstate, -1, 2"

            # Switch workspaces with mainMod + [0-9]
            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            "$mainMod SHIFT, L, layoutmsg, swapnext"
            "$mainMod SHIFT, H, layoutmsg, swapprev"
            "$mainMod, SPACE, layoutmsg, orientationnext"

            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 10"

            # Scroll through existing workspaces with mainMod + scroll
            "$mainMod, mouse_down, workspace, e+1"
            "$mainMod, mouse_up, workspace, e-1"
            "$mainMod, LEFT, workspace, e-1"
            "$mainMod, RIGHT, workspace, e+1"
        ];

        bindm = [
            # Move/resize windows with mainMod + LMB/RMB and dragging
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
        ];
    };
}
