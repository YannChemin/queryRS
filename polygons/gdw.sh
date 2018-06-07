#!/bin/bash

cutline=$1
inF=$2
ouF=$3

gdalwarp -cutline $1 -crop_to_cutline $2 $3 -overwrite -q
./stats $3 32767 >> stats.csv


#for testing only
#gdalwarp -cutline farm.shp -crop_to_cutline NDVI.tif farm_NDVI.tif -overwrite -q
#./stats farm_NDVI.tif 32767 >> stats.csv
