### PYTHON

ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )

### BUFR

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION OFF )

ecbuild_set_verbose( BUFR_TABLES_PATH "/usr/local/apps/libemos/tables/bufr/text/000408" )

### FDB

ecbuild_set_verbose( ENABLE_ODBDIRECT   OFF  CACHE BOOL "Direct access to ODB on HPC" )

ecbuild_set_verbose( ENABLE_FDB         ON  CACHE BOOL "Both for FDB4 (client) and FDB5 (server)" )
ecbuild_set_verbose( ENABLE_FDB5        ON  CACHE BOOL "FDB5 enabled in client" )
ecbuild_set_verbose( ENABLE_MARS_SERVER OFF CACHE BOOL "Don't build the server, just the libraries" )
ecbuild_set_verbose( ENABLE_POINTDB     OFF CACHE BOOL "Don't build the pointdb server, just the libraries" )

ecbuild_set_verbose( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )

ecbuild_set_verbose( MKL_ROOT /usr/local/apps/intel/16.0.3/compilers_and_libraries/linux/mkl CACHE PATH "MKL" FORCE )