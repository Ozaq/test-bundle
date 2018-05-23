cmake_minimum_required( VERSION 2.8.11 FATAL_ERROR )

macro( ecbuild_set_verbose )
    set( ${ARGV} )
    message( STATUS "SET ${ARGV0} = ${ARGV1}" )
endmacro()

if( ECMWF )
    include( ecmwf.cmake OPTIONAL )
endif()

if( ECMWF_HPC )
	set(ECMWF ON)
	include( ecmwf-hpc-local-config.cmake OPTIONAL )
endif()

if( LOCALCONFIG )
    include( ${LOCALCONFIG} OPTIONAL )
endif()

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )

include( ecbuild_bundle )

project( MarsClient C CXX Fortran )

ecbuild_bundle_initialize()

ecbuild_bundle( PROJECT bufrdc_tables STASH "mars/bufrdc_tables" TAG    000412 )

ecbuild_bundle( PROJECT ecbuild      STASH "ecsdk/ecbuild"       TAG    2.9.0 )

ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )  # FIXME remove when lxg/ecgb can handle this
ecbuild_add_option( FEATURE ECCODES DESCRIPTION "" DEFAULT ON )

if( HAVE_ECCODES )
ecbuild_bundle( PROJECT eccodes      STASH "eccodes/eccodes"   BRANCH  release/2.8.0 )
else()
ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"     TAG 1.24.0 )
endif()


ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG     4.8.4  )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      TAG     4.5.5  )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       BRANCH  release/0.21.0 )
ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      BRANCH  release/0.11.0 )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG     0.15.7 )

ecbuild_add_option( FEATURE FDB5 DESCRIPTION "" DEFAULT OFF )

if( HAVE_FDB5 )
    ecbuild_bundle( PROJECT mars-server  STASH "mars/mars-server" BRANCH  develop )
endif()

ecbuild_bundle( PROJECT transi       STASH "atlas/transi"        TAG   0.4.4  )
ecbuild_bundle( PROJECT atlas        STASH "atlas/atlas"         BRANCH  develop )
ecbuild_bundle( PROJECT mir          STASH "mir/mir"             BRANCH  release/0.9.0 )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"    BRANCH  develop )

ecbuild_bundle_finalize()

