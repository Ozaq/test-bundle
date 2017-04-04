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

ecbuild_bundle( PROJECT bufrdc_tables STASH "mars/bufrdc_tables" TAG    000410 )

ecbuild_bundle( PROJECT ecbuild      STASH "ecsdk/ecbuild"     TAG     2.6.1 )

ecbuild_add_option( FEATURE ECCODES DESCRIPTION "" DEFAULT ON )

if( HAVE_ECCODES )
    ecbuild_bundle( PROJECT eccodes      STASH "eccodes/eccodes" TAG 2.2.0 )
else()
    ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"   TAG 1.21.0 )
endif()

ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG  4.8.4 )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG  15f1b6bcca2df6be4f86d2ab9e9a387832d7507c )  # ahead of 0.16.2 (current develop)
ecbuild_bundle( PROJECT fckit        STASH "ecsdk/fckit"       TAG  0.3.0 )
ecbuild_bundle( PROJECT transi       STASH "atlas/transi"      TAG  3d7c6ce43718f57fa42dc15324c5849c787d68e5 )  # ahead of 0.4.0
ecbuild_bundle( PROJECT atlas        STASH "atlas/atlas"       TAG  cc02327738e355e50bbf22c41e03116782987ae0 )  # ahead of 0.9.0
ecbuild_bundle( PROJECT mir          STASH "mir/mir"           TAG  0.7.6 )

ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      TAG  0.5.0 )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG  0.16.1 )

ecbuild_add_option( FEATURE FDB5 DESCRIPTION "" DEFAULT OFF )

if( HAVE_FDB5 )
    ecbuild_bundle( PROJECT mars-server  STASH "mars/mars-server"  TAG   7.8.3 )
endif()

#ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  TAG  feature-mir-0.7.4 )
ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH  feature/mir UPDATE )

ecbuild_bundle_finalize()
