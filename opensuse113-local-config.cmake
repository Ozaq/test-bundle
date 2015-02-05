include( ecmwf-local-config.cmake OPTIONAL )

# general

set( CMAKE_C_COMPILER_INIT        gcc )
set( CMAKE_CXX_COMPILER_INIT      g++ )
set( CMAKE_Fortran_COMPILER_INIT  pgf90 )

# grib_api
set( GRIB_API_SHARE "/usr/local/apps/grib_api/1.13.0/GNU/4.8.1/share/grib_api" )
set( GRIB_API_DEFINITION_PATH "${GRIB_API_SHARE}/definitions" )
set( GRIB_API_SAMPLES_PATH    "${GRIB_API_SHARE}/samples" )

# libemos
set( ENABLE_FORTRAN90 OFF CACHE INTERNAL "" )
set( ENABLE_FORTRAN   OFF CACHE INTERNAL "" )
set( WITH_PGI_FORTRAN ON  CACHE INTERNAL "" )
