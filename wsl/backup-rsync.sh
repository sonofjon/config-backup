#!/bin/bash
#
# Back up the WSL home directory to the Windows user's Backup folder
# using rsync.
#
# Usage:
#
#   backup-rsync.sh [ -v ] [ -n ]
#
# Symlink in bin directory:
#
#   ln -s ~/dotfiles/config-backup/wsl/backup-rsync.sh ~/bin/backup-rsync.sh
#
# and add to user crontab, e.g.
#
#   1 5 * * * ~/bin/backup-rsync.sh
#
# or symlink in anacron directory, e.g.
#
#   ln -s ~/dotfiles/config-backup/wsl/backup-rsync.sh /etc/cron.hourly/backup-rsync
#

WINUSER=$(powershell.exe '$env:UserName' | tr -d '\r')
SOURCE=$HOME/
DEST=/mnt/c/Users/"$WINUSER"/Backup/wsl/
EXCLUDE_FILE=$HOME/dotfiles/config-backup/wsl/exclude-rsync.cfg
LOG_FILE=$HOME/backup.log

rsync -a --delete "$@" --exclude-from="$EXCLUDE_FILE" "$SOURCE" "$DEST" --log-file="$LOG_FILE" > /dev/null 2>&1
