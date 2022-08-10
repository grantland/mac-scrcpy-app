#!/bin/bash
export ANDROID_SDK_HOME=/opt/android_sdk
export PATH=${PATH}:${ANDROID_SDK_HOME}/platform-tools
export PATH=${PATH}:/opt/homebrew/bin/

if [[ "$1" == "false" ]]
then
  echo "User canceled"
  exit 0;
fi

for f in "$@"
do
  d=$(echo $f | cut -d ' ' -f1)
  echo "Start scrpy on '$d'"
  scrcpy -wS -s $d &
done