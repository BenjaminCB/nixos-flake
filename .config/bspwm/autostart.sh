#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#$HOME/.config/polybar/launch.sh &

run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

case $(cat /proc/sys/kernel/hostname) in
    ("void-desktop")
        /home/bcb/git/scripts/screen_rotation.sh
    ;;
    ("void-loptop")
        batsignal -b -w 25 -c 10 -d 5 -f 80 &
        setxkbmap -layout us -variant dvorak -option "caps:swapescape"
    ;;
esac

numlockx on &
dunst &
redshift &

# im am root picture
# https://imgur.com/a/Ix8QBfl
nitrogen --head=1 --set-zoom-fill ~/git/wallpapers/horizontal/Shiomiya_Shiori_Holding_Shy_C_Programming_language_wp_gruvbox.png
nitrogen --head=0 --set-auto ~/git/wallpapers/horizontal/i_am_root_gruvbox.jpg
nitrogen --head=2 --set-auto ~/git/wallpapers/vertical/anime_book_computer_grevbox_neofetch_vim.png
