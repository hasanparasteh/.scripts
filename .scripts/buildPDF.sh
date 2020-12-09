#!/bin/sh

if ! [ -x "$(command -v groff)" ]; then
    echo "Error: groff is not installed on this system" >&2
    exit 1
fi

exec groff -ms $1 -p -T pdf > out.pdf

