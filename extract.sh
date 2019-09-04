#!/bin/bash

FROM=`readlink -f "$1"`
MASK="$2"
TO=`readlink -f "$3"`
FULL="$4"

usage()
{
    echo "Usage: $(basename $0) <FROM> <MASK> <TO> [--full]";
    exit 1
}

[[ ( -z $FROM ) || ( -z $MASK ) || ( -z $TO ) ]] && usage

extract_one()
{
    echo "ectract from $1"
    if cd "$TO"; then
        tar --extract --recursion --preserve-permissions --totals --sparse --ignore-failed-read --gzip \
        --listed-incremental=/dev/null \
        --verbose \
        --file="$1" \
        --wildcards "$MASK" \
        -C "$TO"
    fi
}

if [[ -n $FULL ]]; then
    frompath="$(dirname $FROM)"
    for f in $(ls -rt $frompath/*.tar.gz); do
        extract_one "$(readlink -f "$f")"
        [[ "$FROM" = "$(readlink -f "$f")" ]] && break
    done;    
else    
    extract_one "$FROM"
fi


