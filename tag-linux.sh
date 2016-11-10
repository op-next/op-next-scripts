#!/bin/bash
git tag -s v`make kernelversion` -m "op-next `make kernelversion`"
