# linux-audio-configs
My configuration files for alsa and pulseaudio, improving sound quality.

## Usage
First backup your existing files
```
./backup.sh
```
Then install
```
./install.sh
```
You can also restore both files from the backup folder
```
./restore.sh
```
If your alsa or pulseaudio only reads global configuration files, you need to manually replace the contents of `/etc/asound.conf` with `./config/.asoundrc` and `/etc/pulse/daemon.conf` with `./config/daemon.conf`.
