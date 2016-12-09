cmake_minimum_required( VERSION 2.8.11 FATAL_ERROR )

if( ECMWF )
    include( ecmwf.cmake OPTIONAL )
endif()

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )

include( ecbuild_bundle )

project( MarsClient C CXX Fortran )

ecbuild_bundle_initialize()

ecbuild_requires_macro_version( 2.5 )

ecbuild_add_option( FEATURE ECCODES DESCRIPTION "" DEFAULT ON )
if( HAVE_ECCODES )
    ecbuild_bundle( PROJECT eccodes  STASH "eccodes/eccodes"   TAG  2.0.2 )
else()
    ecbuild_bundle( PROJECT grib_api STASH "grib/grib_api"     TAG  1.19.0 )
endif()

ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG  4.8.2 )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       BRANCH  develop  UPDATE )
ecbuild_bundle( PROJECT fckit        STASH "ecsdk/fckit"       TAG  0.2.1 )
ecbuild_bundle( PROJECT transi       STASH "atlas/transi"      BRANCH  develop  UPDATE )
ecbuild_bundle( PROJECT atlas        STASH "atlas/atlas"       BRANCH  develop  UPDATE )
ecbuild_bundle( PROJECT mir          STASH "mir/mir"           BRANCH  develop  UPDATE )

ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      TAG  0.3.2 )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG  0.16.1 )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH  feature/mir  UPDATE )

ecbuild_bundle_finalize()
