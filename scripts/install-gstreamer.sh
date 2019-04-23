#!/bin/bash
# Download and unpack the Android GStreamer

mkdir /tmp/android
cd /tmp/android
curl -Lo gstreamer.tar.bz2 "https://s3-us-west-2.amazonaws.com/qgroundcontrol/dependencies/gstreamer-1.0-android-universal-1.14.4.tar.bz2"
tar xjf gstreamer.tar.bz2
mv gstreamer* /tmp/build
