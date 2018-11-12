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

ecbuild_bundle( PROJECT bufrdc_tables STASH "mars/bufrdc_tables" TAG    000413 )

ecbuild_bundle( PROJECT ecbuild      STASH "ecsdk/ecbuild"       TAG    2.9.1 )

ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )  # FIXME remove when lxg/ecgb can handle this
ecbuild_add_option( FEATURE ECCODES DESCRIPTION "" DEFAULT ON )

if( HAVE_ECCODES )
    ecbuild_bundle( PROJECT eccodes      STASH "eccodes/eccodes"   TAG rc_v2.9.1_EFAS_20181001 )
else()
ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"     TAG 1.24.0 )
endif()


ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG     4.8.5  )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      TAG     4.5.7  )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG     0.23.1 )
ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      TAG     0.15.0 )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG     0.15.8 )

ecbuild_add_option( FEATURE FDB5 DESCRIPTION "" DEFAULT OFF )

if( HAVE_FDB5 )
ecbuild_bundle( PROJECT mars-server  STASH "mars/mars-server"  BRANCH   hotfix/7.14.2 UPDATE )
endif()


ecbuild_add_option( FEATURE TRANS DESCRIPTION "Support for spectral transforms using IFS code" )
if(HAVE_TRANS)
    ecbuild_enable_fortran( REQUIRED MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/module )
    ecbuild_bundle( PROJECT transi       STASH "atlas/transi"        TAG     0.4.4 )
endif()

ecbuild_bundle( PROJECT atlas        STASH "atlas/atlas"         TAG     0.15.2 )
ecbuild_bundle( PROJECT mir          STASH "mir/mir"             BRANCH  hotfix/MIR-318-expand-cache-paths UPDATE )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"    TAG     6.23.0 )

ecbuild_bundle_finalize()
