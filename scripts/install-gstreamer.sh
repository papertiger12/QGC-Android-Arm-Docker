#!/bin/bash
# Download and unpack the Android GStreamer

mkdir /tmp/android
cd /tmp/android
wget https://qgroundcontrol.s3-us-west-2.amazonaws.com/dependencies/gstreamer-1.0-android-universal-1.18.1.tar.xz
mkdir gstreamer-1.0-android-universal-1.18.1
tar xf gstreamer-1.0-android-universal-1.18.1.tar.xz -C gstreamer-1.0-android-universal-1.18.1
rm gstreamer-1.0-android-universal-1.18.1.tar.xz
# discard other architectures for now
rm -rf gstreamer-1.0-android-universal-1.18.1/arm64
rm -rf gstreamer-1.0-android-universal-1.18.1/x86
rm -rf gstreamer-1.0-android-universal-1.18.1/x86_64

mv gstreamer* /tmp/build
