ecbuild_set_verbose( ENABLE_MPI  OFF  CACHE BOOL "MPI" )

### PYTHON

ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )

### BUFR

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION OFF )

ecbuild_set_verbose( BUFR_TABLES_PATH "/usr/local/apps/libemos/tables/bufr/text/000408" )

### FDB

ecbuild_set_verbose( ENABLE_ODBDIRECT   OFF  CACHE BOOL "Direct access to ODB on HPC" )

ecbuild_set_verbose( ENABLE_FDB5        ON  CACHE BOOL "FDB5 enabled in client" )
ecbuild_set_verbose( ENABLE_MIR_TOOLS   ON  CACHE BOOL "Install MIR tools" )

ecbuild_set_verbose( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )
