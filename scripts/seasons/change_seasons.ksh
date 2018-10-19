#!/bin/ksh

#-- to create many files
#  cdo -C -f nc -splityear infile.nc data_years/year_

#-- concatenate all years files
#  cdo -cat 'data_years/year_*.nc' cat_years_all.nc
  
#-- DJF, MAM, JJAS and ON

  cdo -yearavg -select,season=ON   cat_years_all.nc seasons_ON_yearavg.nc
  cdo -yearavg -select,season=JJAS cat_years_all.nc seasons_JJAS_yearavg.nc
  cdo -yearavg -select,season=MAM  cat_years_all.nc seasons_MAM_yearavg.nc
  cdo -yearavg -select,season=DJF  cat_years_all.nc seasons_DJF_yearavg.nc
	
  cdo mergetime seasons_DJF_yearavg.nc seasons_MAM_yearavg.nc seasons_JJAS_yearavg.nc seasons_ON_yearavg.nc seasons_DJF_MAM_JJAS_ON.nc
  
