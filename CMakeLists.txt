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
    ecbuild_bundle( PROJECT eccodes      STASH "eccodes/eccodes" TAG rc_v2.4.0_20170605 )
else()
    ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"   TAG rc_v1.23.0_20170605 )
endif()


ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG     4.8.4  )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG  97a399a2b32ebe1d368caaadb93c490dcc2d6987 )  # current release/0.17.0
ecbuild_bundle( PROJECT fckit        STASH "ecsdk/fckit"       TAG  91547a61ce05682ca35871e8c523ec6d5c7b57ad )  # ahead of 0.3.3
ecbuild_bundle( PROJECT transi       STASH "atlas/transi"      TAG  0.4.2 )
ecbuild_bundle( PROJECT atlas        STASH "atlas/atlas"       TAG  8775ef19fe35e8d025e242ac0e3607f3da4e1fe5 )  # current release/0.11.0
ecbuild_bundle( PROJECT mir          STASH "mir/mir"           TAG  0.7.7 )

ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      TAG  0.5.0 )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG  d486e7a3e43a16067b952b817f1bab42f6e19743 )  # ahead of 0.17.0

ecbuild_add_option( FEATURE FDB5 DESCRIPTION "" DEFAULT OFF )

if( HAVE_FDB5 )
    ecbuild_bundle( PROJECT mars-server  STASH "mars/mars-server"  TAG   7.9.2 )
endif()

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH  feature/mir UPDATE )

ecbuild_bundle_finalize()
