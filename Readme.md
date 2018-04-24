FPGA-SoC-U-Boot-ZYBO
====================================================================================

Overview
------------------------------------------------------------------------------------

### Introduction

This Repository provides a U-Boot Image for ZYBO.

### Features

* U-Boot v2016.03 (customized)
  + Build for ZYBO
  + Customized boot by uEnv.txt
  + Customized boot by boot.scr
  + Enable bootmenu

Build U-boot for ZYBO
------------------------------------------------------------------------------------

There are two ways

1. run scripts/build-u-boot-2016.03-zynq-zybo.sh (easy)
2. run this chapter step-by-step (annoying)

### Download U-boot Source

#### Clone from git.denx.de/u-boot.git

```console
shell$ git clone git://git.denx.de/u-boot.git u-boot-2016.03-zynq-zybo
```

#### Checkout v2016.03

```console
shell$ cd u-boot-2016.03-zynq-zybo
shell$ git checkout -b v2016.03-zynq-zybo refs/tags/v2016.03
```

### Patch for zynq-zybo

```console
shell$ patch -p0 < ../files/u-boot-2016.03-zynq-zybo.diff
shell$ git add --update
shell$ git commit -m "patch for zynq-zybo"
shell$ git tag -a v2016.03-zynq-zybo-1 -m "Release v2016.03-1 for ZYBO"
```

### Setup for Build 

```console
shell$ cd u-boot-2016.03-zynq-zybo
shell$ export ARCH=arm
shell$ export CROSS_COMPILE=arm-linux-gnueabihf-
shell$ make zynq_zybo_defconfig
```

### Build u-boot

```console
shell$ make
```

### Copy u-boot.img, u-boot.elf and u-boot-spl.sfp to root directory

```console
shell$ cp spl/boot.bin  ../boot.bin
shell$ cp u-boot.img    ../u-boot.img
shell$ cp u-boot        ../u-boot.elf
```
