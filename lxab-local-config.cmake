include( ecmwf-local-config.cmake OPTIONAL )

# general

set( CMAKE_C_COMPILER_INIT        gcc )
set( CMAKE_CXX_COMPILER_INIT      g++ )
set( CMAKE_Fortran_COMPILER_INIT  gfortran )

set( BOOST_ROOT "/usr/local/apps/boost/1.53.0/" ) # for unit tests

# grib_api
set( GRIB_API_SHARE "/usr/local/lib/metaps/lib/grib_api/1.12.3/share/grib_api" )
set( GRIB_API_DEFINITION_PATH "${GRIB_API_SHARE}/definitions" )
set( GRIB_API_SAMPLES_PATH    "${GRIB_API_SHARE}/samples" )
