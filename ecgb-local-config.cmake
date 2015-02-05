include( ecmwf-local-config.cmake OPTIONAL )

# general

set( CMAKE_C_COMPILER_INIT        gcc )
set( CMAKE_CXX_COMPILER_INIT      g++ )
set( CMAKE_Fortran_COMPILER_INIT  gfortran )

# grib_api
set( GRIB_API_SHARE "/usr/local/apps/grib_api/1.12.3" )
set( GRIB_API_DEFINITION_PATH "${GRIB_API_SHARE}/definitions" )
set( GRIB_API_SAMPLES_PATH    "${GRIB_API_SHARE}/samples" )
