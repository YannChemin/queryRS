#!/bin/bash
file=LC081480462017060701T1-SC20180429194956_NDVI.tif
long=72.7164530
lat=20.2235884

bash ./queryRS.sh $file $long $lat


bash ./queryRS.sh $file -2.0 47.0
