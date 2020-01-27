#!/bin/bash

echo "Removing daemon.conf..."
if ! (rm $HOME/.config/pulse/daemon.conf); then
	echo "Error while removing. Exiting..." 1>&2
	exit 1
fi

echo "Restoring asound.conf..."
if ! (cp -f backup/asound.conf /etc/); then
	echo "Error while copying. Exiting..." 1>&2
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
