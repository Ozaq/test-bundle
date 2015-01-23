# general

set( CMAKE_C_COMPILER_INIT        gcc )
set( CMAKE_CXX_COMPILER_INIT      g++ )
set( CMAKE_Fortran_COMPILER_INIT  gfortran )

set( CMAKE_INSTALL_PREFIX "/var/tmp/matq/install/MarsClient" )

# grib_api
# needed only to run from build tree
set( GRIB_API_SHARE "/usr/local/apps/grib_api/1.12.3/GNU/4.8.1/share/grib_api" )
set( GRIB_API_DEFINITION_PATH "${GRIB_API_SHARE}/definitions" )
set( GRIB_API_SAMPLES_PATH    "${GRIB_API_SHARE}/samples" )

# fdb
set( BUILD_IFSIO OFF )
set( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )

# libemos
# set( LOCAL_TABLE_PATH "/usr/local/apps/libemos/tables/bufr/text/000401" )
set( ENABLE_INSTALL_TABLES OFF )