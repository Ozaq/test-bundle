cmake_minimum_required( VERSION 2.8.4 FATAL_ERROR )

if( ECMWF )
    include( ecmwf.cmake OPTIONAL )
endif()

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )

include( ecbuild_bundle )

project( MarsClient C CXX Fortran )

ecbuild_bundle_initialize()

ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"     BRANCH     hotfix/1.14.3   UPDATE )
ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  BRANCH     release/4.7.0   UPDATE )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      BRANCH     hotfix/4.2.1    UPDATE )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       BRANCH     release/0.10.0  UPDATE )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       BRANCH     hotfix/0.10.5.3 UPDATE )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH     hotfix/6.11.2   UPDATE )

ecbuild_bundle_finalize()
