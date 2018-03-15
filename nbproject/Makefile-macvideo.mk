#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=arm-linux-gnueabihf-gcc
CCC=arm-linux-gnueabihf-g++
CXX=arm-linux-gnueabihf-g++
FC=gfortran
AS=arm-linux-gnueabihf-as

# Macros
CND_PLATFORM=arm-linux-gnueabihf-Linux
CND_DLIB_EXT=so
CND_CONF=macvideo
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/macvideo.o


# C Compiler Flags
CFLAGS=--sysroot=${SYSROOT}

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L${SYSROOT}/usr/lib -Lam335x/app_loader/prussdrv/dist/Release/arm-linux-gnueabihf-Linux ledscape/dist/Release_Static/arm-linux-gnueabihf-Linux/libledscape.a am335x/app_loader/prussdrv/dist/Release/arm-linux-gnueabihf-Linux/libprussdrv.a -lXtst -lX11 -lpthread

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/macvideo

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/macvideo: ledscape/dist/Release_Static/arm-linux-gnueabihf-Linux/libledscape.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/macvideo: am335x/app_loader/prussdrv/dist/Release/arm-linux-gnueabihf-Linux/libprussdrv.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/macvideo: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/macvideo ${OBJECTFILES} ${LDLIBSOPTIONS} --sysroot=${SYSROOT}

${OBJECTDIR}/macvideo.o: macvideo.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Wall -D_DEFAULT_SOURCE -Iledscape/include -I${SYSROOT}/usr/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/macvideo.o macvideo.c

# Subprojects
.build-subprojects:
	cd ledscape && ${MAKE}  -f Makefile CONF=Release_Static
	cd am335x/app_loader/prussdrv && ${MAKE}  -f Makefile CONF=Release
	cd ledscape && ${MAKE}  -f Makefile CONF=Release

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/macvideo

# Subprojects
.clean-subprojects:
	cd ledscape && ${MAKE}  -f Makefile CONF=Release_Static clean
	cd am335x/app_loader/prussdrv && ${MAKE}  -f Makefile CONF=Release clean
	cd ledscape && ${MAKE}  -f Makefile CONF=Release clean

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
