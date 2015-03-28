cmake_minimum_required( VERSION 2.8.4 FATAL_ERROR )

include( ${INCLUDE_CONFIG}-local-config.cmake OPTIONAL )

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )

include( ecbuild_bundle )

project( MarsClient C CXX )

ecbuild_bundle_initialize()

ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"     BRANCH     develop  UPDATE )
ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  BRANCH     develop  UPDATE )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      BRANCH     develop  UPDATE )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       BRANCH     develop  UPDATE )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       BRANCH     develop  UPDATE )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH     develop  UPDATE )

ecbuild_bundle_finalize()
