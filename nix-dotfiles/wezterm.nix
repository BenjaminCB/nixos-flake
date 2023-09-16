{
    enable = true;
    colorSchemes.myTheme.background = "#282828";
    extraConfig = ''
        return {
            font = wezterm.font("FiraCode"),
            font_size = 18.0,
            color_scheme = "myTheme",
            hide_mouse_cursor_when_typing = false
        }
    '';
}
