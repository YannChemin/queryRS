from osgeo import gdal

input_cutline = sys.argv[1]
input_raster = sys.argv[2]
output_raster = sys.argv[3]

ds = gdal.Warp(output_raster,
              input_raster,
              format = 'GTiff',
              cutlineDSName = input_cutline,
              cutlineLayer = 'extent',
              dstNodata = 0)
ds = None
