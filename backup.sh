#!/bin/bash

mkdir -p backup

if [ -f $HOME/.config/pulse/daemon.conf ]; then
	echo "Backing up daemon.conf..."
	if ! (cp -ab $HOME/.config/pulse/daemon.conf backup/); then
		echo "Backup error. Exiting..." 1>&2
		exit 1
	fi
else
	echo "daemon.conf not found. Skipping this file..."
fi

if [ -f $HOME/.asoundrc ]; then
	echo "Backing up .asoundrc..."
	if ! (cp -ab $HOME/.asoundrc backup/); then
		echo "Backup error. Exiting..." 1>&2
		exit 1
	fi
else
	echo ".asoundrc not found. Skipping this file..."
fi

echo "Done!"
