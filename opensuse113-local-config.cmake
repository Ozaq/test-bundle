# general

set( CMAKE_BUILD_TYPE             Production )

set( CMAKE_C_COMPILER_INIT        gcc )
set( CMAKE_CXX_COMPILER_INIT      g++ )
set( CMAKE_Fortran_COMPILER_INIT  pgf90 )

set( CMAKE_INSTALL_PREFIX "/tmp/install/MarsClient" )

# grib_api
set( GRIB_API_SHARE "/usr/local/apps/grib_api/1.13.0/GNU/4.8.1/share/grib_api" )
set( GRIB_API_DEFINITION_PATH "${GRIB_API_SHARE}/definitions" )
set( GRIB_API_SAMPLES_PATH    "${GRIB_API_SHARE}/samples" )

# fdb
set( BUILD_IFSIO OFF )
set( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )

# libemos
# set( LOCAL_TABLE_PATH "/usr/local/apps/libemos/tables/bufr/text/000401" )
set( ENABLE_INSTALL_TABLES OFF )

set( ENABLE_FORTRAN90 OFF )
set( ENABLE_FORTRAN OFF )
set( WITH_PGI_FORTRAN ON )
