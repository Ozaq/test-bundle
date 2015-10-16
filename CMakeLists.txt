cmake_minimum_required( VERSION 2.8.4 FATAL_ERROR )

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )

include( ecbuild_bundle )

project( MarsClient C CXX Fortran )

ecbuild_bundle_initialize()

# ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"     TAG     1.14.1 )
ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"     TAG     rc_v1.14.2_20151016 )
ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG     4.6.8  )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      BRANCH  release/4.2.0 UPDATE )
# ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      TAG     4.2.0  )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG     0.6.2  )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG     0.10.2 )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH  release/6.10.0  UPDATE )
# ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  TAG     6.9.0  )

ecbuild_bundle_finalize()
