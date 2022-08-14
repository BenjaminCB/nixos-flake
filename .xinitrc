#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --output DVI-D-0 --mode 1920x1080 --pos 3000x587 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate left --output DP-0 --primary --mode 1920x1080 --pos 1080x364 --rotate normal --output DP-1 --off --output DVI-D-1 --off

nitrogen --head=1 --set-zoom-fill ~/git/wallpapers/horizontal/Shiomiya_Shiori_Holding_Shy_C_Programming_language_wp_gruvbox.png
nitrogen --head=0 --set-auto ~/git/wallpapers/horizontal/i_am_root_gruvbox.jpg
nitrogen --head=2 --set-auto ~/git/wallpapers/vertical/anime_book_computer_grevbox_neofetch_vim.png

# exec bspwm
exec awesome

