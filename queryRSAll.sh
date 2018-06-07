#!/bin/bash

# $1 : Source directory (with many Raster images)
# $2 : Longitude coordinate of the Raster image (North-South)
# $3 : Latitude coordinate of the Raster image (East-West)

#Process search for pixel values
cd $1
for file in $(ls *.tif)
do
	echo $(gdallocationinfo -valonly -wgs84 $file $2 $3) &
done

