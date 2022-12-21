ecbuild_set_verbose( ENABLE_MPI  OFF  CACHE BOOL "MPI" )

### PYTHON

ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )

### BUFR

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION OFF )

ecbuild_set_verbose( ENABLE_ODB2        ON  CACHE BOOL "ODB2 in metkit" )
ecbuild_set_verbose( ENABLE_MIR_TOOLS   ON  CACHE BOOL "Install MIR tools" )

ecbuild_set_verbose( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )
