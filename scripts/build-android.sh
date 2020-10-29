#!/bin/sh

cd rust-android
cargo clean

TARGET_AR=/Users/logan/.NDK/arm64/bin/aarch64-linux-android-ar
TARGET_CC=/Users/logan/.NDK/arm64/bin/aarch64-linux-android-clang
cargo build --target aarch64-linux-android --release

TARGET_AR=/Users/logan/.NDK/arm/bin/arm-linux-androideabi-ar
TARGET_CC=/Users/logan/.NDK/arm/bin/arm-linux-androideabi-clang
cargo build --target armv7-linux-androideabi --release

TARGET_AR=/Users/logan/.NDK/x86/bin/i686-linux-android-ar
TARGET_CC=/Users/logan/.NDK/x86/bin/i686-linux-android-clang
cargo build --target i686-linux-android --release

cd ../

LIBS_DIR="android/app/src/main/jniLibs"

rm -rf ${LIBS_DIR};

mkdir ${LIBS_DIR}
mkdir ${LIBS_DIR}/arm64-v8a
mkdir ${LIBS_DIR}/armeabi-v7a
mkdir ${LIBS_DIR}/x86

cp rust-android/target/aarch64-linux-android/release/librust_android.so  ${LIBS_DIR}/arm64-v8a/librust_android.so
cp rust-android/target/armv7-linux-androideabi/release/librust_android.so  ${LIBS_DIR}/armeabi-v7a/librust_android.so
cp rust-android/target/i686-linux-android/release/librust_android.so  ${LIBS_DIR}/x86/librust_android.so