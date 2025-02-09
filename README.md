These Docker images allow you to very easily build [QGroundControl](https://github.com/mavlink/qgroundcontrol) for android and get an useable .apk file.

# QGroundControl Android Docker images

This builds an .apk file with a self-signed key for QGroundControl.

## Build from master

docker run -it williangalvani/qgc-android-build

## Build from local folder

docker run -it --mount type=bind,source=YOUR-QGC-ROOT,target=/home/user/qgroundcontrol williangalvani/qgc-android-build

## Copy .apk from container

docker cp \$(docker ps -alq):/home/user/qgroundcontrol.apk .

or from qgroundcontrol/build/dist/build/outputs/apk/dist-release-unsigned.apk if you build from local folder

## Remove a previous version(if any) of qgc in android device:

adb uninstall org.mavlink.qgroundcontrol

## Install to your device

adb install qgroundcontrol.apk

## Build other versions

```
// arm64
docker image build . -f .\5.12-android_arm64_v8a.Dockerfile -t local-qgc-64

// get id of your image
docker image ls

docker run -it --mount type=bind,source=<QGC_PATH>,target=/home/user/qgroundcontrol local-qgc-64
```

- https://github.com/Williangalvani/QGC-Android-Arm-Docker
- https://github.com/a12e/docker-qt
