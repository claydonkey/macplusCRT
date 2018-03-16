# macplusCRT


![alt text](https://github.com/claydonkey/macplusCRT/MACCY.png ",ACPLUSCRT")

A refactoring of Trammell Hudsons cool work using the BBB to render the single bit Macintosh display.
Currently for use with cross-compiler arm-linux-gnueabihf

## Contents

Includes and compiles [LEDScape](https://github.com/osresearch/LEDscape) (LEDscape/src/ledscape/ ONLY), and utilities from the [am335x_PRU_Package](https://github.com/beagleboard/am335x_pru_package) : pasm (PRU assembler) and libprissdrv .

pasm compiles macvideo.p (pru driver) to macvideo.bin
c executables are compiled for use with the Xvfb script start-xvfb

The BBB must have the pru(s) enabled by copying and extracting dtb > dts, edit, compile dts > dtb and reinsert:

Generate DTS from DTB:

	dtc -I dtb -O dts -o archlinux-`uname -r`.dts /boot/uboot/dtbs/am335x-boneblack.dtb

Enable the PRU.  Change status from "disabled" to "okay"

Generate DTB back from DTS:

	dtc -O dtb -I dts -o /boot/uboot/dtbs/am335x-boneblack.dtb archlinux-`uname -r`.dts

## Compilation

    make help
    This makefile supports the following configurations:
        eventmap macvideo x11mac 

    and the following targets:
        build  (default target)
        clean
        clobber
        all
        help

    Makefile Usage:
        make [CONF=<CONFIGURATION>] [SUB=no] build
        make [CONF=<CONFIGURATION>] [SUB=no] clean
        make [SUB=no] clobber
        make [SUB=no] all
        make help

    Target 'build' will build a specific configuration and, unless 'SUB=no',
        also build subprojects.
    Target 'clean' will clean a specific configuration and, unless 'SUB=no',
        also clean subprojects.
    Target 'clobber' will remove all built files from all configurations and,
        unless 'SUB=no', also from subprojects.
    Target 'all' will will build all configurations and, unless 'SUB=no',
        also build subprojects.
    Target 'help' prints this message.

    Note: LOCAL + CROSS COMPILATION
        make all SYSROOT=<your sysroot> CC=<your gcc compiler>
        SYSROOT defaults to null and CC defaults to arm-linux-eabihf-gcc
        i.e for local compilation use 'make all CC=gcc'
	    cross-compilation use 'make all SYSROOT=/somepathtosysroot'
    
