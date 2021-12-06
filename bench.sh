#! /bin/bash

set -e
set -u
set -x

CC="clang++"
CCFLAGS="-std=c++11 -O2 -g -Wall -Werror -mavx -masm=intel"
I386_TARGET=""
X8664_TARGET=""

$CC bench.cc tzcnt.S -o tzcnt $CCFLAGS $X8664_TARGET
$CC bench.cc tzcntfix.S -o tzcntfix $CCFLAGS $X8664_TARGET

set +x

echo "+---------------------+--------------+----------------------------------+"

./tzcnt
./tzcnt
./tzcnt

./tzcntfix
./tzcntfix
./tzcntfix

echo "+---------------------+--------------+----------------------------------+"
