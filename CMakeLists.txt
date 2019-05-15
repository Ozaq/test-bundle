cmake_minimum_required( VERSION 3.1 FATAL_ERROR )

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

ecbuild_bundle( PROJECT bufrdc_tables STASH "mars/bufrdc_tables" TAG    000414 )

ecbuild_bundle( PROJECT ecbuild      STASH "ecsdk/ecbuild"     TAG 2.10.2 )

ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )  # FIXME remove when lxg/ecgb can handle this

ecbuild_bundle( PROJECT eccodes      STASH "eccodes/eccodes"   TAG 2.12.4 )
ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG 4.9.0 )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      TAG 4.5.9 )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       BRANCH hotfix/1.0.2 UPDATE )
ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      BRANCH release/1.1.0 UPDATE )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG 0.15.10 )

ecbuild_add_option( FEATURE FDB5 DESCRIPTION "" DEFAULT OFF )
if( HAVE_FDB5 )
ecbuild_bundle( PROJECT fdb5         STASH "mars/fdb5"         BRANCH release/5.3.0 UPDATE )
endif()

ecbuild_bundle( PROJECT atlas        STASH "atlas/atlas"       TAG 0.17.1 )
ecbuild_bundle( PROJECT mir          STASH "mir/mir"           TAG 1.2.5 )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH hotfix/6.25.4 UPDATE )

ecbuild_bundle_finalize()
