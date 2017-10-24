TOP = ..

DIRS = src
streamApp_DEPEND_DIRS  = src

# Look if we have EPICS R3.13 or R3.14
ifeq ($(wildcard $(TOP)/configure),)
  # EPICS R3.13
  include $(TOP)/config/CONFIG_APP
  CONFIG = $(TOP)/config
else
  # EPICS R3.14
  include $(TOP)/configure/CONFIG
  ifneq ($(words $(CALC) $(SYNAPPS)), 0)
    # with synApps calc module (contains scalcout)
    DIRS += srcSynApps
    srcSynApps_DEPEND_DIRS  = src
    streamApp_DEPEND_DIRS  += srcSynApps
  endif
endif

DIRS += streamApp

include $(CONFIG)/RULES_DIRS



####### EC hints to force this build when it chokes.
## First do: make -f Makefile -k
## One then sees that the compile of AsynDriverInterface.cc fails. So cd and compile adding the include directories that don't show up for me otherwise.

## cd src/O.linux-x86_64
##/usr/bin/g++  -D_GNU_SOURCE -D_DEFAULT_SOURCE            -D_X86_64_  -DUNIX  -Dlinux     -O3 -g   -Wall      -mtune=generic     -m64 -fPIC -I. -I../O.Common -I. -I. -I.. -I../../../include/compiler/gcc -I../../../include/os/Linux -I../../../include -I/home/echurch/epics/base-3.15.5/include/compiler/gcc -I/home/echurch/epics/base-3.15.5/include/os/Linux -I/home/echurch/epics/base-3.15.5/include     -I/home/echurch/epics/asyn4-32/asyn/asynDriver   -I/home/echurch/epics/asyn4-32/asyn/interfaces -I/home/echurch/epics/asyn4-32/asyn/asynGpib  -c ../AsynDriverInterface.cc

# then when the complaint about not being able to find a rule for being libasyn.a (what?, I already have it), do this, still in O.linux-x86_64:
#[echurch@wd73963 O.linux-x86_64]$ gcc -shared -o libstrea.so  DebugInterface.o DummyInterface.o AsynDriverInterface.o EnumConverter.o BCDConverter.o RawConverter.o RawFloatConverter.o BinaryConverter.o ChecksumConverter.o MantissaExponentConverter.o TimestampConverter.o devaoStream.o devaiStream.o devboStream.o devbiStream.o devmbboStream.o devmbbiStream.o devmbboDirectStream.o devmbbiDirectStream.o devlongoutStream.o devlonginStream.o devstringoutStream.o devstringinStream.o devwaveformStream.o devcalcoutStream.o devaaiStream.o devaaoStream.o StreamVersion.o StreamBuffer.o StreamError.o StreamProtocol.o StreamFormatConverter.o StreamCore.o StreamBusInterface.o StreamEpics.o
