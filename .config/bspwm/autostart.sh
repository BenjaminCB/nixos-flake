#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

/home/bcb/git/scripts/screen_rotation.sh 

#$HOME/.config/polybar/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

#Some ways to set your wallpaper besides variety or nitrogen
#feh --bg-scale ~/.config/bspwm/wall.png &
# feh --bg-fill ~/Pictures/foggy_forest_1.jpg &
#feh --randomize --bg-fill ~/Képek/*
#feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*

# im am root picture
# https://imgur.com/a/Ix8QBfl
nitrogen --head=0 --set-auto ~/Pictures/wallpapers/horizontal/i_am_root.jpg 
nitrogen --head=1 --set-auto ~/Pictures/wallpapers/vertical/explosion_vertical.png 

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

#nitrogen --restore &
# conky -c ~/.config/conky/inf-crimson.conkyrc &
run nm-applet &
# run pamac-tray &
run xfce4-power-manager &
numlockx on &
# blueberry-tray &
picom --config $HOME/.config/bspwm/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dunst &
run volumeicon &
redshift &
#nitrogen --restore &
#run caffeine &
#run vivaldi-stable &
#run firefox &
#run thunar &
#run dropbox &
#run insync start &
#run discord &
#run spotify &
#run atom &
