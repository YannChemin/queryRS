#!/bin/bash

# $1 : Source directory (with many Raster images)
# $2 : Longitude coordinate of the Raster image (North-South)
# $3 : Latitude coordinate of the Raster image (East-West)

VI=$4

#Process search for pixel values
cd $1
for file in $(ls *$VI.tif)
do
	dateT=$(echo $file | sed 's/LC08......\(.*\)..T.-\(.*\)/\1/')
	if [ $(gdallocationinfo -valonly -wgs84 $file $2 $3) -ne "" ]
	then
		echo $dateT","$(gdallocationinfo -valonly -wgs84 $file $2 $3) 
	fi
done

