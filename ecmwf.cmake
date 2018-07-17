ecbuild_set_verbose( ENABLE_MPI  OFF  CACHE BOOL "MPI" )

### PYTHON

ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )

### BUFR

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION OFF )

ecbuild_set_verbose( BUFR_TABLES_PATH "/usr/local/apps/libemos/tables/bufr/text/000408" )

### FDB

ecbuild_set_verbose( ENABLE_FDB         ON  CACHE BOOL "Both for FDB4 (client) and FDB5 (server)" )

ecbuild_set_verbose( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )
