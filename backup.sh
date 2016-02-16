#!/bin/bash

export BACKUP_ROOTDIR=/mnt/backup
export SELF_DIR=/usr/local/backup
export EXCLUDE="$SELF_DIR/backup_exclude"
export WEEKS=2

CONF_DIR="$SELF_DIR/conf.d"
[[ -d "$CONF_DIR" ]] && run-parts --report "$CONF_DIR";



