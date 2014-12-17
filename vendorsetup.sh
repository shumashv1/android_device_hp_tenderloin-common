#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.
#
# In particular, you can add lunch options with the add_lunch_combo
# function: add_lunch_combo generic-eng

# HACK: Create symlink folder to point to proper qcom platform sources
TOPDIR=$PWD

ln -s -f $TOPDIR/hardware/qcom/display-caf/msm8960 $TOPDIR/hardware/qcom/display-caf/msm8660
ln -s -f $TOPDIR/hardware/qcom/audio-caf/msm8960 $TOPDIR/hardware/qcom/audio-caf/msm8660
ln -s -f $TOPDIR/hardware/qcom/media-caf/msm8960 $TOPDIR/hardware/qcom/media-caf/msm8660
cp -f -l $TOPDIR/hardware/libhardware/include/hardware/gralloc.h $TOPDIR/frameworks/av/include
cp -f -l $TOPDIR/device/hp/tenderloin/libbt-vendor/include/hardware.h $TOPDIR/frameworks/av/include
cp -f -l $TOPDIR/kernel/hp/tenderloin/include/linux/fb.h $TOPDIR/frameworks/av/include
cp -f -l $TOPDIR/kernel/hp/tenderloin/include/linux/ion.h cp -f -l $TOPDIR/hardware/qcom/display-caf/msm8660/libgralloc/
mkdir -p $TOPDIR/out/target/product/tenderloin/obj/KERNEL_OBJ/usr/include/linux 
cp -f -l $TOPDIR/device/hp/tenderloin/include/linux/msm_ion.h $TOPDIR/out/target/product/tenderloin/obj/KERNEL_OBJ/usr/include/linux

