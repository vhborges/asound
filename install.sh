#!/bin/bash

echo "Copying daemon.conf..."
if ! (cp -f configs/daemon.conf $HOME/.config/pulse/); then
	echo "Copy error. Exiting..." 1>&2
	exit 1
fi

#echo "Copying .asoundrc..."
#if ! (cp -f configs/.asoundrc $HOME/); then
#	echo "Copy error. Exiting..." 1>&2
#	exit 1
#fi

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
