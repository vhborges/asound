#!/bin/bash

ln -s $(pwd)/daemon.conf $HOME/.config/pulse/daemon.conf

sudo ln -sf $(pwd)/asound.conf /etc/asound.conf

pulseaudio -k
sleep 10
pulseaudio --start
