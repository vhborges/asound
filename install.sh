#!/bin/bash

echo "Linking daemon.conf..."
if ! (ln -sf $(pwd)/configs/daemon.conf $HOME/.config/pulse/); then
	echo "Linkage error. Exiting..." 1>&2
	exit 1
fi

echo "Linking asound.conf..."
if ! (ln -sf $(pwd)/configs/asound.conf /etc/); then
	echo "Linkage error. Maybe you didn't run this script as root?" 1>&2
	exit 1
fi

echo "Restarting pulseaudio..."

if ! (pulseaudio -k); then
	echo "Error killing the pulseaudio module" 1>&2
	exit 1
fi

sleep 3

if ! (pulseaudio --start); then
	echo "Error starting the pulseaudio module" 1>&2
	exit 1
fi

echo "Done!"
