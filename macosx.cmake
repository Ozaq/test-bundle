ecbuild_set_verbose( ENABLE_ECMWF_DEVELOPMENT ON CACHE BOOL "ECMWF development mode" )

ecbuild_set_verbose( ENABLE_FORTRAN   OFF CACHE BOOL "Fortran disabled" )
ecbuild_set_verbose( ENABLE_PYTHON    OFF CACHE BOOL "Python disabled" )

ecbuild_set_verbose( ENABLE_NETCDF    ON CACHE BOOL "NETCDF disabled" )

ecbuild_set_verbose( ENABLE_FDB       ON  CACHE BOOL "FDB enabled" )
ecbuild_set_verbose( ENABLE_FDB5      ON  CACHE BOOL "FDB5 enabled" )
# ecbuild_set_verbose( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION     OFF   CACHE BOOL "libemos BUFR single precision off" )
ecbuild_set_verbose( ENABLE_ECCODES_THREADS      ON    CACHE BOOL "eccodes POSIX threads" )
ecbuild_set_verbose( ENABLE_AEC                  OFF   CACHE BOOL "eccodes AEC aka SZip encoding" )
ecbuild_set_verbose( ENABLE_JPG                  OFF   CACHE BOOL "eccodes JPG encoding" )
ecbuild_set_verbose( ENABLE_MEMFS                ON    CACHE BOOL "eccodes memfs enabled" )
