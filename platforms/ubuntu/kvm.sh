#!/bin/bash -e

# Android studio - KVM - acceleration as documented here:
# https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux
egrep -c '(vmx|svm)' /proc/cpuinfo
kvm-ok
