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
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include pasm-Makefile.mk

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/pasm.o \
	${OBJECTDIR}/pasmdot.o \
	${OBJECTDIR}/pasmexp.o \
	${OBJECTDIR}/pasmmacro.o \
	${OBJECTDIR}/pasmop.o \
	${OBJECTDIR}/pasmpp.o \
	${OBJECTDIR}/pasmstruct.o


# C Compiler Flags
CFLAGS=-W -Wall

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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/pasm

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/pasm: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/pasm ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/pasm.o: pasm.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O3 -Wall -D_UNIX_ -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pasm.o pasm.c

${OBJECTDIR}/pasmdot.o: pasmdot.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O3 -Wall -D_UNIX_ -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pasmdot.o pasmdot.c

${OBJECTDIR}/pasmexp.o: pasmexp.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O3 -Wall -D_UNIX_ -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pasmexp.o pasmexp.c

${OBJECTDIR}/pasmmacro.o: pasmmacro.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O3 -Wall -D_UNIX_ -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pasmmacro.o pasmmacro.c

${OBJECTDIR}/pasmop.o: pasmop.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O3 -Wall -D_UNIX_ -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pasmop.o pasmop.c

${OBJECTDIR}/pasmpp.o: pasmpp.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O3 -Wall -D_UNIX_ -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pasmpp.o pasmpp.c

${OBJECTDIR}/pasmstruct.o: pasmstruct.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O3 -Wall -D_UNIX_ -Iinclude -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/pasmstruct.o pasmstruct.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/pasm

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
