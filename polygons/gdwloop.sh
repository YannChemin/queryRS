#!/bin/bash

nprocs=16
cutline=farm
VI=NDVI

cd ~/RSDATA/OUT_L8_Ya

#cutline work with GDALWARP (parallel job)
for file in *$VI.tif
do
	gdalwarp -cutline $cutline.shp -crop_to_cutline $file $cutline\_$file -overwrite -q &
done

#This will wait until all subset are processed
while kill -0 $(pidof gdw.sh) >/dev/null 2>&1
do
	sleep 1
done

#stats extraction (OpenMP code, very fast !)
rm -f $cutline.csv
for file in $(ls $cutline\_*.tif)
do
	~/queryRS/trunk/polygons/stats $file 32768 >> $cutline.csv
done

#cleanup the mess
rm -f $cutline\_*.tif

