#!/bin/bash

sudo rm /etc/asound.conf
sudo cp backup/asound.conf /etc/asound.conf

if [[ $# -ne 0 ]] && [[ $1 -eq "all" ]]; then
  rm $HOME/.config/pulse/daemon.conf
fi

pulseaudio -k
pulseaudio --start
