#!/bin/bash
if [[ ! -d "qgroundcontrol" ]]; then
    echo "Local QGC not found, cloning master!"
    git clone --recursive https://github.com/mavlink/qgroundcontrol/
    cloned=true
fi
cd qgroundcontrol
cp -R /tmp/build/gstreamer* .
mkdir build
cd build
#make clean
qmake -r .. ANDROID_EXTRA_LIBS+=$ANDROID_DEV/lib/libcrypto.so ANDROID_EXTRA_LIBS+=$ANDROID_DEV/lib/libssl.so
make -j$(nproc)
make install INSTALL_ROOT=dist
androiddeployqt --verbose --input android-libQGroundControl.so-deployment-settings.json --output dist/ --android-platform android-29 --deployment bundled --gradle --release
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore /tmp/build/selfsigned.keystore dist/build/outputs/apk/dist-release-unsigned.apk qgc-self-signed -storepass potato

echo "---------------------------------------------------------------------------------------------"
echo "---------------------------------------Build Done--------------------------------------------"
echo "---------------------------------------------------------------------------------------------"
echo ""
if [ "$cloned" = true ] ; then
    mv /home/user/qgroundcontrol/build/dist/build/outputs/apk/dist-release-unsigned.apk /home/user/qgroundcontrol.apk
    echo "Run this command to get the .apk file:"
    echo "docker cp \$(docker ps -alq):/home/user/qgroundcontrol.apk ."
    echo "to copy .apk to your current directory"
else
    echo "Build done"
    echo "The .apk file is at 'qgroundcontrol/build/dist/build/outputs/apk/dist-release-unsigned.apk'"
fi