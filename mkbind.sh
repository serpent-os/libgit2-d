#!/bin/bash
set -e
set -x

imports="--global-import core.stdc.stdarg --global-import std.conv"

${DSTEP:-dstep} source/git2/git2.i -o source/git2/bindings.d \
      --normalize-modules=true \
      --public-submodules=true \
      --rename-enum-members=false \
      --translate-macros=false \
      --alias-enum-members=true \
      --package git2 \
	  --global-attribute '@safe' \
      --global-attribute '@nogc' \
      --global-attribute 'nothrow' \
	  -Isubprojects/libgit2/install/usr/local/include/ \
      $imports \
