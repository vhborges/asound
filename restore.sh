#!/bin/bash

echo "Removing daemon.conf..."
if ! (rm -f $HOME/.config/pulse/daemon.conf); then
	echo "Remove error. Exiting..." 1>&2
	exit 1
fi

echo "Restoring asound.conf..."
if ! (sudo rm /etc/asound.conf && sudo cp -a backup/asound.conf /etc/); then
	echo "Copy error. Relinking daemon.conf and exiting..." 1>&2
	ln -sf $(pwd)/configs/daemon.conf $HOME/.config/pulse/
	exit 1
fi

echo "Restarting pulseaudio..."

if ! (pulseaudio -k); then
	echo "Error killing the pulseaudio module. Please restart it manually for this to work." 1>&2
	exit 1
fi

sleep 3

if ! (pulseaudio --start); then
	echo "Error starting the pulseaudio module. Please restart it manually for this to work." 1>&2
	exit 1
fi

echo "Done!"
