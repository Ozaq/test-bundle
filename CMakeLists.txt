cmake_minimum_required( VERSION 2.8.4 FATAL_ERROR )

if( ECMWF )
    include( ecmwf.cmake OPTIONAL )
endif()

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )

include( ecbuild_bundle )

project( MarsClient C CXX Fortran )

ecbuild_bundle_initialize()

ecbuild_bundle( PROJECT bufrdc_tables STASH "mars/bufrdc_tables" TAG    000409 )

ecbuild_bundle( PROJECT ecbuild      STASH "ecsdk/ecbuild"     TAG     2.4.1  )

ecbuild_add_option( FEATURE ECCODES DESCRIPTION "" DEFAULT ON )

if( HAVE_ECCODES )
    ecbuild_bundle( PROJECT eccodes      STASH "eccodes/eccodes" TAG 2.0.1 )
else()
    ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"   TAG 1.19.0 )
endif()


ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG     4.8.1  )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      TAG     4.4.5  )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG     0.14.1 )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG     0.16.0 )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  TAG     6.15.9 )

ecbuild_bundle_finalize()
