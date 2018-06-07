#!/bin/bash

# $1 : Source file (Raster image)
# $2 : Longitude coordinate of the Raster image (North-South)
# $3 : Latitude coordinate of the Raster image (East-West)

#test for number output re='^-?[0-9]+$' for potential negative number
re='^[0-9]+$'

#Process search for pixel values
val=$(gdallocationinfo -valonly -wgs84 $1 $2 $3)
if [[ $val =~ re ]]; then echo $val; fi
