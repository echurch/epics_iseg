#!../../bin/linux-x86_64/serialTest

## You may have to change serialTest to something else
## everywhere it appears in this file

< envPaths

## Register all support components
dbLoadDatabase("../../dbd/serialTest.dbd",0,0)
serialTest_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet ("STREAM_PROTOCOL_PATH", ".:/home/echurch/epics/serialTest/db")

drvAsynSerialPortConfigure("L0","/dev/ttyUSB0",0,0,0)
asynSetOption("L0", -1, "baud", "9600")
asynSetOption("L0", -1, "bits", "8")
asynSetOption("L0", -1, "parity", "none")
asynSetOption("L0", -1, "stop", "1")
asynSetOption("L0", -1, "clocal", "Y")
asynSetOption("L0", -1, "crtscts", "Y")

## Load record instances
###dbLoadRecords("../../db/serialTest.db","user=echurch")
###dbLoadRecords("../../db/asynRecord.db","P=PS1607001:,R=000:VMON,PORT=L0,ADDR=0,OMAX=100,IMAX=100")

dbLoadRecords("../../db/asynRecord.db","P=PS1607001:,R=ISEGNHS20,PORT=L0,ADDR=0")
dbLoadRecords("../../db/asynRecord_Channels.db","P=PS1607001:,R=1,PORT=L0,ADDR=0")


cd ${TOP}/iocBoot/${IOC}
iocInit()

## Start any sequence programs
#seq sncserialTest,"user=echurch"
