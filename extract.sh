#!/bin/bash

FROM=`readlink -f "$1"`
MASK="$2"
TO=`readlink -f "$3"`

usage()
{
    echo "Usage: $(basename $0) <FROM> <MASK> <TO>";
    exit 1
}

[[ ( -z $FROM ) || ( -z $MASK ) || ( -z $TO ) ]] && usage

if cd "$TO"; then
tar --extract --recursion --preserve-permissions --totals --sparse --ignore-failed-read --gzip \
--listed-incremental=/dev/null \
--verbose \
--file="$FROM" \
--wildcards "$MASK" \
-C "$TO"
fi
