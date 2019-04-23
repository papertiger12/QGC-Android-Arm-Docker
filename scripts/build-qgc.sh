#!/bin/bash
git clone --recursive https://github.com/mavlink/qgroundcontrol/
cd qgroundcontrol
cp -R /tmp/build/gstreamer* .
mkdir build && cd build
qmake -r .. ANDROID_EXTRA_LIBS+=$ANDROID_DEV/lib/libcrypto.so ANDROID_EXTRA_LIBS+=$ANDROID_DEV/lib/libssl.so
make -j$(nproc)
make install INSTALL_ROOT=dist
androiddeployqt --input android-libQGroundControl.so-deployment-settings.json --output dist/ --android-platform android-21 --deployment bundled --gradle --release
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore /tmp/build/selfsigned.keystore dist/build/outputs/apk/dist-release-unsigned.apk qgc-self-signed -storepass potato
mv /home/user/qgroundcontrol/build/dist/build/outputs/apk/dist-release-unsigned.apk /home/user/qgroundcontrol.apk
echo "Build done"
echo "exit and run"
echo "docker cp \$(docker ps -alq):/home/user/qgroundcontrol.apk ."
echo "to copy .apk to your current directory"
