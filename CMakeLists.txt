cmake_minimum_required( VERSION 2.8.4 FATAL_ERROR )

include( ${INCLUDE_CONFIG}-local-config.cmake OPTIONAL )

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )

include( ecbuild_bundle )

project( MarsClient C CXX )

ecbuild_bundle_initialize()

ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"     TAG     release/1.14.0  )
ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG     release/4.6.9   )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      TAG     release/4.0.2   )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG     release/0.9.0   )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG     release/0.10.4  )

# ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  TAG     6.6.0   )
ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH  develop UPDATE  )

ecbuild_bundle_finalize()

