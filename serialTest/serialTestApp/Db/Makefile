TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#DB_INSTALLS += $(ASYN)/../db/asynRecord.db
#DB_INSTALLS += $(ASYN)/db/asynRecord.proto

DB_INSTALLS += /home/echurch/epics/serialTest/db/asynRecord.db
DB_INSTALLS += /home/echurch/epics/serialTest/db/asynRecord.proto
COMMONDBDS += asyn.dbd # per ../../serialTestApp/Makefile
#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += xxx.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

