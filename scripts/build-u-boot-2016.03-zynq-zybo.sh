#!/bin/bash

UBOOT_BUILD_DIR=u-boot-2016.03-zynq-zybo

### Download U-Boot Source
git clone git://git.denx.de/u-boot.git $UBOOT_BUILD_DIR
cd $UBOOT_BUILD_DIR

#### Checkout v2016.03
git checkout -b v2016.03-zynq-zybo refs/tags/v2016.03

### Patch for zynq-zybo

patch -p0 < ../files/u-boot-2016.03-zynq-zybo.diff
git add --update
git commit -m "patch for zynq-zybo"
git tag -a v2016.03-zynq-zybo-1 -m "Release v2016.03-1 for ZYBO"

### Setup for Build 

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make zynq_zybo_defconfig

### Build u-boot

make

### Copy u-boot.img, u-boot.elf and u-boot-spl.sfp to root directory

cp spl/boot.bin  ../boot.bin
cp u-boot.img    ../u-boot.img
cp u-boot        ../u-boot.elf

cd ..
