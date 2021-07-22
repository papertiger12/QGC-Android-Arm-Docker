#!/bin/bash
# Download and unpack the Android GStreamer

mkdir /tmp/android
cd /tmp/android
wget --quiet https://qgroundcontrol.s3-us-west-2.amazonaws.com/dependencies/gstreamer-1.0-android-universal-1.18.1.tar.xz
mkdir gstreamer-1.0-android-universal-1.18.1
tar xf gstreamer-1.0-android-universal-1.18.1.tar.xz -C gstreamer-1.0-android-universal-1.18.1
rm gstreamer-1.0-android-universal-1.18.1.tar.xz
mv gstreamer* /tmp/build
