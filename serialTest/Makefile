# Makefile at top of application tree
TOP = .
include $(TOP)/configure/CONFIG

# Directories to build, any order
DIRS += configure
DIRS += $(wildcard *Sup)
DIRS += $(wildcard *App)
DIRS += $(wildcard *Top)
DIRS += $(wildcard iocBoot)

# The build order is controlled by these dependency rules:

# All dirs except configure depend on configure
$(foreach dir, $(filter-out configure, $(DIRS)), \
    $(eval $(dir)_DEPEND_DIRS += configure))

# Any *App dirs depend on all *Sup dirs
$(foreach dir, $(filter %App, $(DIRS)), \
    $(eval $(dir)_DEPEND_DIRS += $(filter %Sup, $(DIRS))))

# Any *Top dirs depend on all *Sup and *App dirs
$(foreach dir, $(filter %Top, $(DIRS)), \
    $(eval $(dir)_DEPEND_DIRS += $(filter %Sup %App, $(DIRS))))

# iocBoot depends on all *App dirs
iocBoot_DEPEND_DIRS += $(filter %App,$(DIRS))

# Add any additional dependency rules here:

include $(TOP)/configure/RULES_TOP




####### When you get the following error
# [echurch@wd73963 O.linux-x86_64]$ perl -CSD /home/echurch/epics/base-3.15.5/bin/linux-x86_64/dbdExpand.pl   -I. -I.. -I../O.Common -I../../../dbd -I../../../../base-3.15.5/dbd -o serialTest.dbd base.dbd drvAsynSerialPort.dbd
# perl -CSD /home/echurch/epics/base-3.15.5/bin/linux-x86_64/dbdExpand.pl   -I. -I.. -I../O.Common -I../../../dbd -I../../../../base-3.15.5/dbd -I/home/echurch/epics/stream/top/dbd  -o serialTest.dbd base.dbd drvAsynSerialPort.dbd stream.dbd asyn.dbd 
#dbdExpand.pl: Can't find file 'drvAsynSerialPort.dbd'
#  while reading 'drvAsynSerialPort.dbd' to create 'serialTest.dbd'
#  Your Makefile may need this dependency rule:
#    $(COMMON_DIR)/serialTest.dbd: $(COMMON_DIR)/drvAsynSerialPort.dbd
# .....
#dbdExpand.pl: Exiting due to errors

###### cd to that directory and add the following include path
# cd  /home/echurch/epics/serialTest/serialTestApp/src/O.linux-x86_64 and prepend the path to drvAsynSerialPort.dbd as follows, and re-do the perl command.
# [echurch@wd73963 O.linux-x86_64]$ perl -CSD /home/echurch/epics/base-3.15.5/bin/linux-x86_64/dbdExpand.pl   -I. -I.. -I../O.Common -I../../../dbd -I../../../../base-3.15.5/dbd -I/home/echurch/epics/stream/top/dbd -I /home/echurch/epics/asyn4-32/dbd  -o serialTest.dbd base.dbd drvAsynSerialPort.dbd stream.dbd asyn.dbd 

### make -k to try to force it to show you what it's doing and plow onward.
#### It may then  want to make the asyn or stream library, which already exists, or give link errors that it can not find symbols (likely in those existing libs) so do this:
# cd /home/echurch/epics/serialTest/serialTestApp/src/O.linux-x86_64
# /usr/bin/g++ -o serialTest -L/home/echurch/epics/stream/top/StreamDevice-master/src/O.linux-x86_64 -L/home/echurch/epics/asyn4-32/lib/linux-x86_64 -L/home/echurch/epics/base-3.15.5/lib/linux-x86_64 -L/home/echurch/epics/serialTest/lib/linux-x86_64 -Wl,-rpath,/home/echurch/epics/base-3.15.5/lib/linux-x86_64 -Wl,-rpath,/home/echurch/epics/serialTest/lib/linux-x86_64           -rdynamic -m64            serialTest_registerRecordDeviceDriver.o serialTestMain.o    -ldbRecStd -ldbCore -lca -lCom -lasyn -lstream
