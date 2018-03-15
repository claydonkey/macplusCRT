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
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/1a7507aa/prussdrv.o


# C Compiler Flags
CFLAGS=-fPIC -mtune=cortex-a8 -march=armv7-a

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libprussdrv.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libprussdrv.a: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libprussdrv.a
	${AR} -rv ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libprussdrv.a ${OBJECTFILES} 
	$(RANLIB) ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libprussdrv.a

${OBJECTDIR}/_ext/1a7507aa/prussdrv.o: ../interface/prussdrv.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/1a7507aa
	${RM} "$@.d"
	$(COMPILE.c) -O3 -Wall -I../include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1a7507aa/prussdrv.o ../interface/prussdrv.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libprussdrv.a

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
