# general

set( CMAKE_BUILD_TYPE             Production )

set( CMAKE_INSTALL_PREFIX "/tmp/install/" )

# fdb
set( BUILD_IFSIO OFF )
set( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )

# libemos
set( ENABLE_INSTALL_TABLES OFF CACHE INTERNAL "" )

