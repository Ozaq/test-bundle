macro( ecbuild_set_verbose )
    set( ${ARGV} )
    message( STATUS "SET ${ARGV0} = ${ARGV1}" )
endmacro()

### PYTHON

ecbuild_set_verbose( ENABLE_PYTHON CACHE BOOL "Python disabled" FORCE )

### FDB

ecbuild_set_verbose( ENABLE_FDB ON CACHE BOOL "FDB enabled" FORCE )

ecbuild_set_verbose( FDB_CONF_FILE "/usr/local/apps/fdb/etc/Config" )

### BUFR

ecbuild_set_verbose( ENABLE_SINGLE_PRECISION OFF )

ecbuild_set_verbose( BUFR_TABLES_PATH "/usr/local/apps/libemos/tables/bufr/text/000408" )

# set( ECMWF_GIT https )
