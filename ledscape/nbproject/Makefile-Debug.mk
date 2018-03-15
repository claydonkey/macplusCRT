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
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/config.o \
	${OBJECTDIR}/fixed-font.o \
	${OBJECTDIR}/ledscape.o \
	${OBJECTDIR}/pru.o \
	${OBJECTDIR}/util.o


# C Compiler Flags
CFLAGS=-g -W -Wall -mtune=cortex-a8 -march=armv7-a

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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libledscape.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libledscape.a: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libledscape.a
	${AR} -rv ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libledscape.a ${OBJECTFILES} 
	$(RANLIB) ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libledscape.a

${OBJECTDIR}/config.o: config.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -D_DEFAULT_SOURCE -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/config.o config.c

${OBJECTDIR}/fixed-font.o: fixed-font.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -D_DEFAULT_SOURCE -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fixed-font.o fixed-font.c

${OBJECTDIR}/ledscape.o: ledscape.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -D_DEFAULT_SOURCE -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/ledscape.o ledscape.c

${OBJECTDIR}/pru.o: pru.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -D_DEFAULT_SOURCE -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pru.o pru.c

${OBJECTDIR}/util.o: util.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -D_DEFAULT_SOURCE -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/util.o util.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libledscape.a

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
