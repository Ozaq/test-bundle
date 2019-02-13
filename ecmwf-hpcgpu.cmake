ecbuild_set_verbose( ENABLE_MPI  OFF  CACHE BOOL "MPI" )

ecbuild_set_verbose( ENABLE_ECMWF_DEVELOPMENT  ON  CACHE BOOL "ECMWF development" )
ecbuild_set_verbose( ENABLE_MEMFS  ON  CACHE BOOL "memfs enabled" )
ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION OFF )

ecbuild_set_verbose( ENABLE_ODBDIRECT   OFF  CACHE BOOL "Direct access to ODB on HPC" )

ecbuild_set_verbose( ENABLE_FDB         ON  CACHE BOOL "Both for FDB4 (client) and FDB5 (server)" )
ecbuild_set_verbose( ENABLE_FDB5        ON  CACHE BOOL "FDB5 enabled in client" )
ecbuild_set_verbose( ENABLE_MARS_SERVER OFF CACHE BOOL "Don't build the server, just the libraries" )
ecbuild_set_verbose( ENABLE_POINTDB     OFF CACHE BOOL "Don't build the pointdb server, just the libraries" )
ecbuild_set_verbose( ENABLE_MIR_TOOLS   ON  CACHE BOOL "Install MIR tools" )

ecbuild_set_verbose( FDB_CONF_FILE "/local_home/maxgpu/etc/Config" )

