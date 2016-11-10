#!/bin/bash

D=`date +%Y%m%d`
sed -i -e "s/^\(EXTRAVERSION.*\)\$/\1-op-next-$D/" Makefile
git add Makefile
git commit -s -m "Update EXTRAVERSION for op-next-$D"
