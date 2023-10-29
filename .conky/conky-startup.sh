#!/bin/sh

if [ "$DESKTOP_SESSION" = "xfce" ]; then 
   sleep 0s
   killall conky
   cd "$HOME/.conky/Rock"
   conky -c "$HOME/.conky/Rock/Rock" &
   exit 0
fi
