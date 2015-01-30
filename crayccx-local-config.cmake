# general

set( CMAKE_C_COMPILER_INIT        cc )
set( CMAKE_CXX_COMPILER_INIT      CC )
set( CMAKE_Fortran_COMPILER_INIT  ftn )

set( CMAKE_INSTALL_PREFIX "$ENV{HOME}/data/install/MarsClient" )

# grib_api
set( GRIB_API_SHARE "/usr/local/apps/grib_api/1.12.3/GNU/48/share/grib_api" )
set( GRIB_API_DEFINITION_PATH "${GRIB_API_SHARE}/definitions" )
set( GRIB_API_SAMPLES_PATH    "${GRIB_API_SHARE}/samples" )

# fdb
set( BUILD_IFSIO OFF )
set( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )

# libemos
set( ENABLE_INSTALL_TABLES OFF CACHE INTERNAL "" )
