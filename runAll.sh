#!/bin/bash
dir=.
long=72.7164530
lat=20.2235884
vi=NDVI

bash ./queryRSAll.sh $dir $long $lat $vi

bash ./queryRSAll.sh . 72.7164530 20.2235884 NDVI
bash ./queryRSAll.sh . 72.7164530 20.2235884 NDWI
