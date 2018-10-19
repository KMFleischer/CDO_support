#!/bin/ksh

#-- create 5 day averages

cdo -timselmean,5 -select,season=DJF 850tNHem.nc 850_5day.nc

#-- create multi-year mean of the same steps (climatology)

cdo -timselmean,5 -select,season=DJF -ydaymean 850tNHem.nc 850_ymean.nc  

#-- sub time series from climatology - create anomaly.nc
                
cdo -b 32 -ydaysub 850_5day.nc 850_ymean.nc 850_anomaly.nc

exit
