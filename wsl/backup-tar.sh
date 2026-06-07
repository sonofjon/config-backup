#!/bin/bash
#
# Create a compressed tar archive of the WSL home directory for manual
# transfer.
#
# Usage:
#
#   backup-tar.sh [ -v ]
#
# Symlink in bin directory:
#
#   ln -s ~/dotfiles/config-backup/wsl/backup-tar.sh ~/bin/backup-tar.sh
#

DEST=/tmp/wsl-backup-$(date +%Y-%m-%d).tar.gz
EXCLUDE_FILE=$HOME/dotfiles/config-backup/wsl/exclude-tar.cfg

tar -czf "$DEST" "$@" --exclude-from="$EXCLUDE_FILE" -C "$HOME" .
