#!/bin/sh

# Usage: sbin/build-all.sh RESOLVER packages.txt

RESOLVER="$1"
PACKAGES_FILE="$2"

xargs stack --resolver "$RESOLVER" build < "$PACKAGES_FILE" 
