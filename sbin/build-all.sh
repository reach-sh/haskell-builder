#!/bin/sh

# Usage: sbin/build-all.sh RESOLVER packages.txt

RESOLVER="$1"
PACKAGES_FILE="$2"

if [ -f stack.yaml ] ; then
  mv stack.yaml stack.yaml.bak
fi

echo '# written by build-all.sh
resolver: $RESOLVER
packages: []
ghc-options:
  "$everything": -haddock
' > stack.yaml

xargs stack --resolver "$RESOLVER" build < "$PACKAGES_FILE" 

if [ -f stack.yaml.bak ] ; then
  mv stack.yaml.bak stack.yaml
else
  rm stack.yaml
fi
