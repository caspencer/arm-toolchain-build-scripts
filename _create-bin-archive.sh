#!/bin/sh

OUTPUT_TAR_DATE=`date +%Y-%m-%d`
OUTPUT_TAR=arm-toolchain-bin-$OUTPUT_TAR_DATE.tar.gz

cd install
tar -czf ../$OUTPUT_TAR *
cd ..
