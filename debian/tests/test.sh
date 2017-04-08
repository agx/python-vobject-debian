#!/bin/bash

set -e

cleanup() {
  [ ! -d "${SCRATCHDIR}" ] || rm -rf "${SCRATCHDIR}"
}

trap cleanup EXIT

SCRATCHDIR=`mktemp -d`

cp ../../tests.py $SCRATCHDIR/
ln -s $(realpath realpath ../../test_files) $SCRATCHDIR/
cd ${SCRATCHDIR} && python${VERSION} ./tests.py
