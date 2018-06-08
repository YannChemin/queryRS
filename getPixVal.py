#!/usr/bin/env python

#-------------------------------------------------
#Original form
#bash ./queryRSAll.sh "~/RSDATA/" $long $lat $vi
#-------------------------------------------------
# $long
# $lat
# $vi : either of these: NDVI NDWI LSWI NBR2
#-------------------------------------------------
# Output is caught by the python subprocess
#-------------------------------------------------

# Pythonized form 
import sys
import subprocess
csvVals=subprocess.call(['~/remotesensing/queryRS/trunk/queryRSAll.sh',"~/RSDATA/",sys.argv[1],sys.argv[2],sys.argv[3]])
print csvVals

