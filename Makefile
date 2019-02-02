# Variables are documented in common/build.sh.
BASE_IMAGE_NAME = varnish
VERSIONS = 5 6
OPENSHIFT_NAMESPACES =
DOCKER_BUILD_CONTEXT = ..

# HACK:  Ensure that 'git pull' for old clones doesn't cause confusion.
# New clones should use '--recursive'.
.PHONY: $(shell test -f common/common.mk || echo >&2 'Please do "git submodule update --init" first.')

include common/common.mk

# use clean-versions provided by common.mk
clean-hook: clean-versions

build-serial: generate
test-openshift-remote-cluster: generate