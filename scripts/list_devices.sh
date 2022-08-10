#!/bin/bash
export ANDROID_SDK_HOME=/opt/android_sdk
export PATH=${PATH}:${ANDROID_SDK_HOME}/platform-tools

syslog -s -l i "test"

adb kill-server
adb start-server

adb devices | grep -w 'device' | cut -f1 | xargs -I X sh -c 'c=$(adb -s X shell getprop ro.product.manufacturer);m=$(adb -s X shell getprop ro.product.model);s=$(echo X);echo "$s ($c $m)"'