ecbuild_set_verbose( ENABLE_MPI  OFF  CACHE BOOL "MPI" )

ecbuild_set_verbose( BUNDLE_SKIP_BUFRDC_TABLES   ON CACHE BOOL "skip" )
ecbuild_set_verbose( BUNDLE_SKIP_FDB             ON CACHE BOOL "skip" )
ecbuild_set_verbose( BUNDLE_SKIP_LIBEMOS         ON CACHE BOOL "skip" )

ecbuild_set_verbose( ENABLE_MEMFS                ON  CACHE BOOL "memfs enabled" )
ecbuild_set_verbose( ENABLE_PYTHON               OFF CACHE BOOL "Python disabled" )

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION     OFF )

ecbuild_set_verbose( ENABLE_ODBDIRECT            OFF  CACHE BOOL "Direct access to ODB on HPC" )

ecbuild_set_verbose( ENABLE_FDB         OFF CACHE BOOL "Both for FDB4 (client) and FDB5 (server)" )
ecbuild_set_verbose( ENABLE_FDB5        ON  CACHE BOOL "FDB5 enabled in client" )
ecbuild_set_verbose( ENABLE_MIR_TOOLS   ON  CACHE BOOL "Install MIR tools" )

ecbuild_set_verbose( CPACK_PACKAGING_INSTALL_PREFIX "/opt/mars-client" CACHE PATH "RPM prefix" )
