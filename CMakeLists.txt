cmake_minimum_required( VERSION 2.8.4 FATAL_ERROR )

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )

include( ecbuild_bundle )

project( MarsClient C CXX Fortran )

ecbuild_bundle_initialize()

ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"     TAG     1.13.1 )
ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG     4.6.8  )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      BRANCH  release/4.0.7   UPDATE )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG     0.9.0  )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG     0.10.4 )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH  release/6.7.0   UPDATE )

ecbuild_bundle_finalize()
