#!/bin/bash

BUILDTYPE="Release"
PLATFORM="x86"
COMPILER="UnixMakefile"
COMPILERNAME="Unix Makefiles"
PROJECTNAME='DepthDataCompressedSensing'

FULLPROJECTNAME=$PROJECTNAME
PROJECTFOLDER=$COMPILER"_"$PLATFORM$BUILDTYPE
CMAKECOMMAND=cmake
CMAKECONFPATH=../../
FORCE_32BITS_BUILD=0


if [ $BUILDTYPE = "Debug" ]; then
	if [ $PLATFORM = "x86" ]; then
		FULLPROJECTNAME=$PROJECTNAME"_d"
		FORCE_32BITS_BUILD=1
	elif [ $PLATFORM = "x64" ]; then
		FULLPROJECTNAME=$PROJECTNAME"64_d"
		FORCE_32BITS_BUILD=0
	fi
elif [ $BUILDTYPE = "Release" ]; then
	if [ $PLATFORM = "x86" ]; then
		FULLPROJECTNAME=$PROJECTNAME
		FORCE_32BITS_BUILD=1
	elif [ $PLATFORM = "x64" ]; then
		FULLPROJECTNAME=$PROJECTNAME"64"
		FORCE_32BITS_BUILD=0
	fi
fi


# ----- Remove previously generated files. ----- #
rm -Rf $PROJECTFOLDER


# ----- Generating project file. ----- #
mkdir $PROJECTFOLDER
cd $PROJECTFOLDER

$CMAKECOMMAND -DCMAKE_BUILD_TYPE=$BUILDTYPE -G"$COMPILERNAME" -DFORCE_32BITS_BUILD=$FORCE_32BITS_BUILD $CMAKECONFPATH


# ----- Create build file. ----- #
echo make >> build.sh

cd ..
