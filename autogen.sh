#!/bin/sh
# Autogeneration script, run this script to set up the
# project. Note that you must have ANDROID_SDK set. You 
# also need ANDROID_NDK set if you are using native code.

# This script must run from the PROJECT_DIR or it will fail.

# Retrieve PROJECT_DIR
PROJECT_DIR="$(dirname $0)"

# Adjust these vars to fit your project
PROJECT_NAME="HelloWorld"
PROJECT_TARGET="1"

# Where we install our libraries
LIB_DIR=$PROJECT_DIR/libs

# Find this system's cp and mkdir commands
CP_CMD="$(which cp)"
MKDIR_CMD="$(which mkdir)"

# If ANDROID_SDK is not already set, set it to this default.
# NOTE:	Alter this if you have a different default location.
if [ -z "$ANDROID_SDK" ]; then
	# Change ANDROID_SDK below to the path of your SDK
	export ANDROID_SDK=$HOME/Android/SDK	#This is a symbolic link to the SDK on my system
fi

# Set the android command
ANDROID_CMD=$ANDROID_SDK/tools/android

# Verify that the android tool exists and error if unavailable
if [ ! -x "$ANDROID_CMD" ]; then
	echo "ERROR: android sdk is unavailable."
	echo "Be sure you've downloaded the sdk and that the ANDROID_SDK environment"
	echo "variable is set to the unzipped sdk directory."
	exit 1
fi

# Locations of support libraries we need from the sdk
LIB_APPCOMPAT_SRC_DIR=$ANDROID_SDK/extras/android/support/v7/appcompat
LIB_APPCOMPAT_INST_DIR=$LIB_DIR/appcompat

# For jni projects we also need the ndk
if [ -d "$PROJECT_DIR/jni" ]; then
	# If ANDROID_NDK is not already set, set it to this default.
	# NOTE:	Alter this if you have a different default location.
	if [ -z "$ANDROID_NDK" ]; then
		# Change ANDROID_NDK below to the path of your NDK
		export ANDROID_NDK=$HOME/Android/NDK	#This is a symbolic link to the NDK on my system
	fi

	# Set the ndk-build command
	NDK_BUILD_CMD=$ANDROID_NDK/ndk-build

	# Verify that the ndk-build cool exists and error if unavailable
	if [ ! -x "$NDK_BUILD_CMD" ]; then
		echo "ERROR: ndk-build is unavailable."
		echo "This package contains jni code which must be compiled using ndk-build."
		echo "Be sure you've downloaded the ndk and that the ANDROID_NDK environment"
		echo "variable is set to the unzipped ndk"
		exit 1
	fi

	# Let's go ahead and build our native sources now
	$NDK_BUILD_CMD
fi

# If there is no libs directory, make it now
if [ ! -d  "$LIB_DIR" ]; then
	$MKDIR_CMD $PROJECT_DIR/libs
fi

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
