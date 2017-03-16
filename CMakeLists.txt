cmake_minimum_required( VERSION 2.8.11 FATAL_ERROR )
if( ECMWF )
    include( ecmwf.cmake OPTIONAL )
endif()
set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )
include( ecbuild_bundle )

project( MarsClient C CXX Fortran )

ecbuild_bundle_initialize()

ecbuild_requires_macro_version( 2.6 )

ecbuild_add_option( FEATURE ECCODES DESCRIPTION "" DEFAULT ON )

if( HAVE_ECCODES )
    ecbuild_bundle( PROJECT eccodes  STASH "eccodes/eccodes"   TAG  2.2.0 )
else()
    ecbuild_bundle( PROJECT grib_api STASH "grib/grib_api"     TAG  1.21.0 )
endif()

ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG  4.8.4 )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG  dc2a75ed87739d016465020a2a9798fb0a4c925b )  # ahead of 0.16.1 (current hotfix/0.16.2)
ecbuild_bundle( PROJECT fckit        STASH "ecsdk/fckit"       TAG  0.3.0 )
ecbuild_bundle( PROJECT transi       STASH "atlas/transi"      TAG  060e69c630569b5e7c339fb9f6d18b658821661d )  # ahead of 0.4.0
ecbuild_bundle( PROJECT atlas        STASH "atlas/atlas"       TAG  846ce37c58324a51027aed5123e317399554018c )  # ahead of 0.9.0
ecbuild_bundle( PROJECT mir          STASH "mir/mir"           TAG  0.7.5 )

ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      TAG  0.5.0 )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG  0.16.1 )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  TAG  feature-mir-0.7.4 )

ecbuild_bundle_finalize()
