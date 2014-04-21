#!/bin/sh
# Autogeneration script, run this script to set up the
# project. Note that you must have ANDROID_SDK set and 
# ANDROID_NDK set if you are using native code.

# This script must run from the PROJECT_DIR or it will fail.

# Retrieve PROJECT_DIR
PROJECT_DIR="$(dirname $0)"

# Adjust these vars to fit your project
PROJECT_NAME="HelloWorld"
PROJECT_TARGET="1"

# Where we install our libraries
LIB_DIR=$PROJECT_DIR/libs

# Find this system's cp command
CP_CMD="$(which cp)"

# Attempt to set the SDK and NDK if not available
if [ -n "$ANDROID_SDK" ]; then
	export ANDROID_SDK=$HOME/Android/SDK	#This is a symbolic link to the SDK on my system
fi

if [ -n "$ANDROID_NDK" ]; then
	export ANDROID_NDK=$HOME/Android/SDK	#This is a symbolic link to the NDK on my system
fi

# Find the android command
ANDROID_CMD=$ANDROID_SDK/tools/android

# Locations of support libraries we need from the sdk
LIB_APPCOMPAT_SRC_DIR=$ANDROID_SDK/extras/android/support/v7/appcompat
LIB_APPCOMPAT_INST_DIR=$LIB_DIR/appcompat

# Obtain the appcompat library that this project needs;
# you must have these installed within your SDK.
$CP_CMD -R $LIB_APPCOMPAT_SRC_DIR $LIB_DIR

# Update the appcompat lib so we can use its resources
$ANDROID_CMD update lib-project \
	--path $LIB_APPCOMPAT_INST_DIR

# Finally, update this project so we can build it
$ANDROID_CMD update project \
	--path $PROJECT_DIR \
	--name $PROJECT_NAME \
	--target $PROJECT_TARGET \
	--subprojects
