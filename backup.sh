#!/bin/bash

mkdir -p backup

if [ -f $HOME/.config/pulse/daemon.conf ]; then
	if ! (rsync -ab $HOME/.config/pulse/daemon.conf backup/); then
		echo "Error while backing up daemon.conf" 1>&2
		exit 1
	fi
else
	echo "daemon.conf not found. Skipping this file..."
fi

if [ -f /etc/asound.conf ]; then
	if ! (rsync -ab /etc/asound.conf backup/); then
		echo "Error while backing up asound.conf" 1>&2
		exit 1
	fi
else
	echo "asound.conf not found. Skipping this file..."
fi

echo "Done!"
