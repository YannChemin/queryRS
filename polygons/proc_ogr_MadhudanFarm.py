#!/usr/bin/python
#import required libraries
from osgeo import osr
from osgeo import ogr

#Part A: Convert points to polygon
#---------------------------------
#Define Feature corners
#North
point0=[73.043333,20.250226]
#East
point1=[73.043836,20.250226]
#South
point2=[73.043836,20.249771]
#West
point3=[73.043333,20.249771]
#Closing Point (initial point)
point4=[73.043333,20.250226]

#Define a ring entity
ring0 = ogr.Geometry(ogr.wkbLinearRing)

#Fill in the 4 points
ring0.AddPoint(point0[0],point0[1])
ring0.AddPoint(point1[0],point1[1])
ring0.AddPoint(point2[0],point2[1])
ring0.AddPoint(point3[0],point3[1])
ring0.AddPoint(point4[0],point4[1])

#make the polygon0
polygon0 = ogr.Geometry(ogr.wkbPolygon)
polygon0.AddGeometry(ring0)

#Now the polygon0 entity is ready 
#to be incorporated into the shapefile

#PART B: Create Shapefile
#------------------------
#Import Shapefile Driver definitions
driver = ogr.GetDriverByName('ESRI Shapefile')

#Open the country shapefile
shapef = driver.CreateDataSource('farm.shp')

#Define WGS84 projection
wgs = osr.SpatialReference()
wgs.ImportFromEPSG(4326)

#Query the first Layer (#0)
layer0 = shapef.CreateLayer("farm", wgs, ogr.wkbPolygon)

#PART C: Add the polygon to the shapefile
#----------------------------------------
#Get the Layer0 definition
featureDefinition = layer0.GetLayerDefn()

#Create feature definition
feature0 = ogr.Feature(featureDefinition)

#Set the polygon0 geometry
feature0.SetGeometry(polygon0)

#Add the feature to the shapefile
layer0.CreateFeature(feature0)

#Clean up the mess
ring0.Destroy()
polygon0.Destroy()
feature0.Destroy()

#close the shapefiles
shapef.Destroy()

#create shapefile projection file
wgs.MorphToESRI()
file = open("farm" + '.prj', 'w')
file.write(wgs.ExportToWkt())
file.close()
