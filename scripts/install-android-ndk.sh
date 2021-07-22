#!/bin/bash
# Download and unpack the Android NDK
# Companion script for the Docker image a12e/docker-qt
# Aurélien Brooke - License: MIT

if [ -z "$NDK_VERSION" ]; then
    echo "Please define the NDK_VERSION environment variable as desired, e.g. r18b"
    exit 1
fi

if [ -z "$ANDROID_NDK_ROOT" ]; then
    echo "Please define the ANDROID_NDK_ROOT environment variable as desired"
    exit 1
fi

set -e #quit on error

mkdir /tmp/android
cd /tmp/android
curl -Lo ndk.zip "https://dl.google.com/android/repository/android-ndk-${NDK_VERSION}-linux-x86_64.zip"
unzip -q ndk.zip
mv android-ndk-* $ANDROID_NDK_ROOT
chmod -R +rX $ANDROID_NDK_ROOT
rm ndk.zip
rm -rf /tmp/android
# cleanup time!
# TODO: refactor this.
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-16
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-17
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-18
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-19
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-20
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-21
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-22
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-23
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-24
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-25
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-26
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-27
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/platforms/android-28
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/toolchains/aarch64-linux-android-4.9
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/toolchains/x86-4.9
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/toolchains/x86_64-4.9
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/toolchains/llvm/prebuilt/linux-x86_64/i686-linux-android
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/toolchains/llvm/prebuilt/linux-x86_64/aarch64-linux-android
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/aarch64-linux-android
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/i686-linux-android
rm -rf /opt/android-sdk/ndk-${NDK_VERSION}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/x86_64-linux-android
