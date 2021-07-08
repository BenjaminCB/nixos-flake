#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

export AWT_TOOLKIT=MTollkit

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [systemd-detect-virt = "oracle"];
	/usr/bin/VBoxClient-all
fi
