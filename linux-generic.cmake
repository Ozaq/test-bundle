ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )

ecbuild_set_verbose( ENABLE_FDB ON CACHE BOOL "FDB enabled" )
# ecbuild_set_verbose( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION     OFF   CACHE BOOL "libemos BUFR single precision off" )
ecbuild_set_verbose( ENABLE_ECCODES_THREADS      ON    CACHE BOOL "eccodes POSIX threads" )
ecbuild_set_verbose( ENABLE_AEC                  ON    CACHE BOOL "eccodes AEC aka SZip encoding" )

