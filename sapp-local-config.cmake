include( ecmwf-local-config.cmake OPTIONAL )

# general

set( CMAKE_C_COMPILER_INIT        gcc )
set( CMAKE_CXX_COMPILER_INIT      g++ )
set( CMAKE_Fortran_COMPILER_INIT  gfortran )

set( ENABLE_JPG OFF CACHE INTERNAL "" ) # temporary: grib_api 1.13.0 cnanot build with cmake against Jasper when is installed in non-system location
