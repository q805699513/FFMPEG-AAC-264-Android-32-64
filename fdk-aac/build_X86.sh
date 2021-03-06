#!/bin/sh
FFMPEG_TMPDIR=I:/document/resourceCode/fdk-aac/temp
export FFMPEG_TMPDIR
NDK_HOME=I:/soft/android-ndk-r14b
ANDROID_API=android-14

SYSROOT=$NDK_HOME/platforms/$ANDROID_API/arch-x86

ANDROID_BIN=$NDK_HOME/toolchains/x86-4.9/prebuilt/windows-x86_64/bin/

CROSS_COMPILE=${ANDROID_BIN}/i686-linux-android-
 
ARM_INC=$SYSROOT/usr/include

ARM_LIB=$SYSROOT/usr/lib
TOOLCHAIN_PREFIX=${NDK_HOME}/toolchains/x86-4.9/prebuilt/windows-x86_64/bin/i686-linux-android-

FLAGS="--host=x86-linux-android --enable-static --disable-shared"

export CXX="${CROSS_COMPILE}g++ --sysroot=${SYSROOT}"

# export LDFLAGS="$LDFLAGS"
export CFLAGS="-O3 -DANDROID -march=i686 -mtune=intel -mssse3 -mfpmath=sse -m32"
export LDFLAGS="-Wl,-dynamic-linker=/system/bin/linker"
export CC="${TOOLCHAIN_PREFIX}gcc --sysroot=${SYSROOT}"
export CXX="${TOOLCHAIN_PREFIX}g++ --sysroot=${SYSROOT}"
export STRIP="${TOOLCHAIN_PREFIX}strip"
export RANLIB="${TOOLCHAIN_PREFIX}ranlib"
export AR="${TOOLCHAIN_PREFIX}ar"


export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
PREFIX=I:/document/resourceCode/fdk-aac/android/x86
./configure $FLAGS \
--prefix=$PREFIX

make clean
make -j8
make install