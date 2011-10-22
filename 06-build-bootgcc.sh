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
# build and install just the c compiler
#---------------------------------------------------------------------------------

echo "Start of build:" > 06-temp.txt
date >> 06-temp.txt 

mkdir -p gcc-build
cd gcc-build

export CFLAGS="-I$addon_tools_dir/include"
export LDFLAGS="-L$addon_tools_dir/lib"

../$GCC_SRC/configure \
	--target=$target --prefix=$prefix \
	--disable-nls --disable-shared --disable-threads \
	--with-gcc --with-gnu-ld --with-gnu-as --with-dwarf2 \
	--enable-languages=c,c++ --enable-interwork --enable-multilib \
	--with-newlib --with-headers=../newlib-$NEWLIB_VER/newlib/libc/include \
	--disable-libssp --disable-libstdcxx-pch --disable-libmudflap \
	--disable-libgomp -v \
	|| { echo "Error configuring gcc"; exit 1; }

mkdir -p libiberty libcpp fixincludes

$MAKE all-gcc || { echo "Error building gcc"; exit 1; }
$MAKE install-gcc || { echo "Error installing gcc"; exit 1; }

cd ..

echo "End of build:" >> 06-temp.txt
date >> 06-temp.txt 
mv 06-temp.txt 06-ready.txt

