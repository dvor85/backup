#!/bin/bash

export SELF_DIR=$(dirname `readlink -f $0`)
export EXCLUDE="$SELF_DIR/backup.exclude"
export FUNCTIONS="$SELF_DIR/backup.functions"
export CONFIG="$SELF_DIR/backup.config"
export CONF_DIR="$SELF_DIR/conf.d"

source "$CONFIG"

[[ -d "$CONF_DIR" ]] && run-parts --report "$CONF_DIR";



