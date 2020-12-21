#!/bin/bash

if [ -f backup/daemon.conf ]; then
	echo "Restoring daemon.conf..."
	if ! (cp -af backup/daemon.conf $HOME/.config/pulse/); then
		echo "Error while copying. Exiting..." 1>&2
		exit 1
	fi
else
	echo "daemon.conf not found in backup. Skipping this file..."
fi

#if [ -f backup/.asoundrc ]; then
#	echo "Restoring .asoundrc..."
#	if ! (cp -af backup/.asoundrc $HOME/); then
#		echo "Error while copying. Exiting..." 1>&2
#		exit 1
#	fi
#else
#	echo ".asoundrc not found in backup. Skipping this file..."
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
