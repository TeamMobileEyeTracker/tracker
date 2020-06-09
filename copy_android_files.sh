#!/usr/bin/env bash
set -euo pipefail

OPENCV_RN_DIR=$HOME/git/studia/react-native-opencv3
PORTRAIT_CAMERA_PATH="android/src/main/java/com/adamfreeman/rnocv3/PortraitJavaCameraView.java"

CAMERA_VIEW_PATH="android/src/main/java/com/adamfreeman/rnocv3/CvCameraView.java"

CAMERA_VIEW_NM=node_modules/react-native-opencv3/$CAMERA_VIEW_PATH
PORTRAIT_CAMERA_NM=node_modules/react-native-opencv3/$PORTRAIT_CAMERA_PATH

printHelp() {
	echo "copy|reverse"
}

if [ $# -lt 1 ]; then
	printHelp
	exit 1
fi

case $1 in
copy)
	test -f ${CAMERA_VIEW_NM}.bak || cp ${CAMERA_VIEW_NM} ${CAMERA_VIEW_NM}.bak
	cp $OPENCV_RN_DIR/$CAMERA_VIEW_PATH $CAMERA_VIEW_NM
	cp $OPENCV_RN_DIR/$PORTRAIT_CAMERA_PATH $PORTRAIT_CAMERA_NM
	;;
reverse)
	echo "Recovering original java file"
	mv $CAMERA_VIEW_NM.bak $CAMERA_VIEW_NM
	rm $PORTRAIT_CAMERA_NM
	;;
*)
	printHelp
	;;
esac
