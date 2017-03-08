### PYTHON

ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )

### FDB

ecbuild_set_verbose( ENABLE_MARS_SERVER OFF CACHE BOOL "Don't build the server, just the libraries" )
ecbuild_set_verbose( ENABLE_POINTDB     OFF CACHE BOOL "Don't build the pointdb server, just the libraries" )
ecbuild_set_verbose( ENABLE_FDB         ON  CACHE BOOL "Both FDB4 and 5 enabled" )

ecbuild_set_verbose( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )

### BUFR

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION OFF )

ecbuild_set_verbose( BUFR_TABLES_PATH "/usr/local/apps/libemos/tables/bufr/text/000408" )
