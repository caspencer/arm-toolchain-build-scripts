#!/bin/sh

# 
# YAGARTO toolchain                                                       
#                                                                            
# Copyright (C) 2006-2011 by Michael Fischer                                      
# Michael.Fischer@yagarto.de                                                 
#                                                                            
# This program is free software; you can redistribute it and/or modify       
# it under the terms of the GNU General Public License as published by       
# the Free Software Foundation; either version 2 of the License, or          
# (at your option) any later version.                                        
#                                                                            
# This program is distributed in the hope that it will be useful,            
# but WITHOUT ANY WARRANTY; without even the implied warranty of             
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              
# GNU General Public License for more details.                               
#                                                                            
# You should have received a copy of the GNU General Public License          
# along with this program; if not, write to the Free Software                
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 
# 

#---------------------------------------------------------------------------------
# build and install binutils
#---------------------------------------------------------------------------------

echo "Start of build:" > 02-temp.txt
date >> 02-temp.txt 

mkdir -p gmp-build
cd gmp-build

../$GMP_SRC/configure $ABI_MODE \
	--prefix=$addon_tools_dir \
	|| { echo "Error configuring gmp"; exit 1; }

$MAKE || { echo "Error building gmp"; exit 1; }
$MAKE check || { echo "Error checking gmp"; exit 1; }
$MAKE install || { echo "Error installing gmp"; exit 1; }

rm $addon_tools_dir/lib/*.dylib
rm $addon_tools_dir/lib/libgmp.so*

cp ../$GMP_SRC/gmp-impl.h .
cp ../$GMP_SRC/longlong.h .

cd ..

echo "End of build:" >> 02-temp.txt
date >> 02-temp.txt 
mv 02-temp.txt 02-ready.txt


