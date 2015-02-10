#!/bin/bash

set -euax

umask 0022

srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
builddir=$srcdir/build

export TMPDIR="/tmp/max/temp"

rm -rf $builddir
mkdir  $builddir

cd $builddir

# module load ecbuild
module switch PrgEnv-cray  PrgEnv-gnu/5.2.14
# module load craype-target-local_host
module load cmake
module load boost

ecbuild $srcdir -DINCLUDE_CONFIG=cray

make -j4
