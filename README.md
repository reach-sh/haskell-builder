# haskell-builder
A Docker image for building Haskell programs

# General remarks

This is intended to be updated rarely.
It contains a certain set of Haskell packages
that exist in the specified LTS.

Don't bother updating this image every time a new package is added.
Just update it for major changes or for very large packages.

# exclude.txt

Packages to exclude.
`reach` and any extra-deps. sorted.

This must be manually updated.

# packages.txt

sbin/packages-refresh.sh after manually updating exclude.txt
