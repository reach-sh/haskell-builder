IMAGE=reachsh/haskell-builder
VERSION=lts-16.12

# NOTE: prerequisite: reach-lang must exist adjacent to this repo
# NOTE: this is still somewhat manual;
#   double check that exclude.txt is up to date before running
.PHONY: packages.txt
packages.txt:
	sbin/packages-refresh.sh

.PHONY: build
build:
	docker build . -t $IMAGE:$VERSION

.PHONY: push
push:
	docker push $IMAGE:VERSION
