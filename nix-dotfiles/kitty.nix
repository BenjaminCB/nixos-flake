{
    enable = true;
    extraConfig = ''
        tab_bar_style powerline
        tab_bar_edge top
        tab_title_max_length 32
        tab_title_template "{title.split('/')[-1]}"
        active_tab_foreground   #ffffff
        active_tab_background   #888888
        active_tab_font_style   bold-italic
        inactive_tab_foreground #ffffff
        inactive_tab_background #444444
        inactive_tab_font_style normal
    '';
}
