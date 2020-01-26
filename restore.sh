#!/bin/bash

echo "Restoring asound.conf..."
if ! (cp -f backup/asound.conf /etc/asound.conf); then
	echo "Error while copying. Exiting..." 1>&2
	exit 1
fi

if [[ $# -ne 0 ]] && [[ $1 -eq "all" ]]; then
	echo "Removing daemon.conf..."
	if ! (rm $HOME/.config/pulse/daemon.conf); then
		echo "Error while removing. Exiting..." 1>&2
		exit 1
	fi
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
