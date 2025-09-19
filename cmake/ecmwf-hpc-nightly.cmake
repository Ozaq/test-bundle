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

ecbuild_set_verbose( ENABLE_EXPERIMENTAL  OFF   CACHE BOOL "experimental stuff" )
ecbuild_set_verbose( ENABLE_FORTRAN       OFF   CACHE BOOL "fortran support" )
ecbuild_set_verbose( ENABLE_AEC           ON    CACHE BOOL "eccodes AEC aka SZip encoding" )
ecbuild_set_verbose( ENABLE_EIGEN         ON    CACHE BOOL "eigen support" )
ecbuild_set_verbose( ENABLE_LAPACK        ON    CACHE BOOL "lapack support" )
ecbuild_set_verbose( ENABLE_MEMFS         ON    CACHE BOOL "eccodes definitions in memory" )
ecbuild_set_verbose( ENABLE_JPG           OFF   CACHE BOOL "eccodes JPG encoding" )
ecbuild_set_verbose( ENABLE_PROJ          ON    CACHE BOOL "" )
ecbuild_set_verbose( ENABLE_FDB           OFF   CACHE BOOL "Both for FDB4 (client) and FDB5 (server)" )
ecbuild_set_verbose( BUNDLE_SKIP_FDB      ON    CACHE BOOL "" )
