#!/bin/sh

# Usage: sbin/packages-refresh.sh

# Requires the reach-lang repo to be adjacent to this repo

CWD="$(pwd)"
(cd ../reach-lang/hs && stack ls dependencies | cut -d ' ' -f1 > "$CWD/deps.txt")
comm -23 deps.txt exclude.txt > packages.txt
rm deps.txt
