cmake_minimum_required( VERSION 2.8.4 FATAL_ERROR )

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

ecbuild_bundle( PROJECT bufrdc_tables STASH "mars/bufrdc_tables" TAG    000410 )

ecbuild_bundle( PROJECT ecbuild      STASH "ecsdk/ecbuild"     TAG     2.6.1 )

ecbuild_add_option( FEATURE ECCODES DESCRIPTION "" DEFAULT ON )

if( HAVE_ECCODES )
    ecbuild_bundle( PROJECT eccodes      STASH "eccodes/eccodes" TAG 2.1.0 )
else()
    ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"   TAG 1.20.0 )
endif()


ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG     4.8.4  )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      TAG     4.4.6  )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       BRANCH  hotfix/0.16.2 UPDATE )
ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      TAG     0.5.0  )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG     0.15.4.1 )

ecbuild_add_option( FEATURE FDB5 DESCRIPTION "" DEFAULT OFF )

if( HAVE_FDB5 )
    ecbuild_bundle( PROJECT mars-server  STASH "mars/mars-server"  BRANCH     hotfix/7.8.3 UPDATE )
endif()

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH  hotfix/6.17.1 UPDATE ) )

ecbuild_bundle_finalize()
