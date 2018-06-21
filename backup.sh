#!/bin/bash

export BACKUP_ROOTDIR=/mnt/backup
export SELF_DIR=$(dirname `readlink -f $0`)
export EXCLUDE="$SELF_DIR/backup.exclude"
export FUNCTIONS="$SELF_DIR/backup.functions"

#Delete archive every $ROTATE $PERIOD
export ROTATE=2

#Full backup every $PERIOD. In $PERIOD make incremental backup.
export PERIOD="week"

export CONF_DIR="$SELF_DIR/conf.d"
[[ -d "$CONF_DIR" ]] && run-parts --report "$CONF_DIR";



