#!/bin/bash -x

if [ ! -d op-build ]; then
	git clone --recursive git@github.com:op-next/op-build.git
fi

if [ ! -d linux ]; then
	git clone git@github.com:op-next/linux.git
fi

(cd op-build &&
git remote rm upstream ;
git remote add upstream git@github.com:open-power/op-build.git
)

(cd op-build/buildroot &&
git remote rm upstream ;
git remote add upstream https://github.com/buildroot/buildroot.git ;
git remote rm openpower;
git remote add openpower git@github.com:open-power/buildroot.git ;
)

(cd linux &&
git remote rm linus ;
git remote add linus https://github.com/torvalds/linux.git ;
git remote rm openpower ;
git remote add openpower git@github.com:open-power/linux.git ;
)

(cd op-build && git fetch upstream)
(cd op-build/buildroot && git fetch upstream && git fetch openpower)
(cd linux && git fetch linus && git fetch openpower)
