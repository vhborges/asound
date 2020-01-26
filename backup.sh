#!/bin/bash

mkdir -p backup

if [ -f $HOME/.config/pulse/daemon.conf ]; then
	echo "Backing up daemon.conf..."
	if ! (rsync -ab $HOME/.config/pulse/daemon.conf backup/); then
		echo "Backup error. Exiting..." 1>&2
		exit 1
	fi
else
	echo "daemon.conf not found. Skipping this file..."
fi

if [ -f /etc/asound.conf ]; then
	echo "Backing up asound.conf..."
	if ! (rsync -ab /etc/asound.conf backup/); then
		echo "Backup error. Exiting..." 1>&2
		exit 1
	fi
else
	echo "asound.conf not found. Skipping this file..."
fi

echo "Done!"
