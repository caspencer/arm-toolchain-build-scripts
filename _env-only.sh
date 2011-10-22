#!/bin/sh

# 
# YAGARTO toolchain                                                       
#                                                                            
# Copyright (C) 2006-2010 by Michael Fischer                                      
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

export target=arm-none-eabi
export scripts_root=$(pwd)
export prefix=$(pwd)/install
export MAKE=make
export addon_tools_dir=$(pwd)/addontools

mkdir -p $prefix
mkdir -p $addon_tools_dir

export PATH="$PATH:$prefix/bin"

export ABI_MODE='ABI=32'
export CC='gcc -m32'

#---------------------------------------------------------------------------------
# Specify the version we will use
#---------------------------------------------------------------------------------
BINUTILS_VER=2.21.1
export GCC_VER=4.6.1
export NEWLIB_VER=1.19.0
GDB_VER=7.3.1
#GMP_VER=4.3.2
GMP_VER=5.0.2
#MPFR_VER=2.4.2
MPFR_VER=3.1.0
EXPAT_VER=2.0.1
MPC_VER=0.9

#---------------------------------------------------------------------------------
# Specify the source we will use
#---------------------------------------------------------------------------------
export BINUTILS_SRC="binutils-$BINUTILS_VER"
export GCC_SRC="gcc-$GCC_VER"
export NEWLIB_SRC="newlib-$NEWLIB_VER"
export GDB_SRC="gdb-$GDB_VER"
export GMP_SRC="gmp-$GMP_VER"
export MPFR_SRC="mpfr-$MPFR_VER"
export EXPAT_SRC="expat-$EXPAT_VER"
export MPC_SRC="mpc-$MPC_VER"

GCC_CORE_SRC="gcc-core-$GCC_VER"
GCC_GPP_SRC="gcc-g++-$GCC_VER"
