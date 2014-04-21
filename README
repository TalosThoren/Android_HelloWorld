Hello World!
------------

This is a simple hello world project that I am using to learn
Android development. Not surprisingly, it contains code from
the android documentation and tutorial available at the following
location:

https://developer.android.com/training/index.html

Already the code base is no longer a HelloWorld project. It
is instead becoming my baseline for study on how to use the sdk
and ndk. In the end I expect this project to represent a suite
of useful java classes, examples, and scripts intended for use
in more advanced applications later.

Building
--------

I have provided an autogen.sh script for producing the necessary
files and environment. While I use the appcompat library available
for the android sdk, I do not store it in this project. Instead
I expect the developer to have the library available in their sdk
installation.

The autogen.sh will attempt to automatically grab these libraries.
If it can not find them it will complain. It also will complain if
the android command is not found. For the script to work you should
have an environment variable called ANDROID_SDK set to the install
of the sdk on your system. The script also expects the ANDROID_NDK
environment variable to be set if it finds a jni directory.

If you can not or do not want to set your environment variables you
can edit the script and change the ANDROID_SDK and ANDROID_NDK vars
inside of autogen.sh, or you can leave the script alone and make a 
symbolic link to your sdk at $HOME/Android/SDK as this is where the
autogen.sh script defaults to.

JNI Build
---------

The project currently has no JNI code, but that will change. The
autogen.sh script has stub functionality to ensure the NDK environment
is available if it finds a jni directory inside the project directory.
You must still run ndk-build after the autogen.sh script is complete 
to compile your native code.

Ant build
----------

Likewise you must run ant debug or ant release to build the finished
product. Note that you will need to create your own key using the
keytool command provided with the Java JDK in order to build a
release.

You are expected to modify the local.properties file after you run the
autogen.sh script. The autogen.sh script simply adds blank values to
the following entries, which it adds if they are missing:

keystore.dir - The directory where the keystore is located
keystore.name - The filename of the keystore being used
key.name - The alias of the key being used

If you look at ant.properties, you will notice that these variables are
used to find the appropriate key when building a release apk.

Note that you can always build the debug build without generating or
configuring your own keys.
