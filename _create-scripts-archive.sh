#!/bin/sh

OUTPUT_TAR_DATE=`date +%Y-%m`
OUTPUT_TAR_FULL=arm-toolchain-src-full-$OUTPUT_TAR_DATE.tar.gz
OUTPUT_TAR_SCRIPTS_ONLY=arm-toolchain-src-scripts-only-$OUTPUT_TAR_DATE.tar.gz

tar -czf $OUTPUT_TAR_FULL *.sh gpl.txt README download patches

mv download download-bak
mkdir download
cp download-bak/README.TXT download
tar -czf $OUTPUT_TAR_SCRIPTS_ONLY *.sh gpl.txt README download patches
rm -rf download
mv download-bak download

