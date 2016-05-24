cmake_minimum_required( VERSION 2.8.4 FATAL_ERROR )

if( ECMWF )
    include( ecmwf.cmake OPTIONAL )
endif()

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_CURRENT_SOURCE_DIR}/ecbuild/cmake;${CMAKE_MODULE_PATH}" )

include( ecbuild_bundle )

project( MarsClient C CXX Fortran )

ecbuild_bundle_initialize()

### disable BUFRDC table for now
#set( BUFR_TABLES_PATH ${CMAKE_INSTALL_PREFIX}/${INSTALL_DATA_DIR} ) # ensures libemos finds the BUFR tables
ecbuild_bundle( PROJECT bufrdc_tables STASH "mars/bufrdc_tables" TAG    000408 )
#option( ENABLE_LIBEMOS_BUFRDC OFF )

ecbuild_bundle( PROJECT ecbuild      STASH "ecsdk/ecbuild"     TAG     2.2.0  )
ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"     BRANCH  feature/uerra2 UPDATE )
ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG     4.6.8  )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      TAG     4.4.1  )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG     0.12.1 )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG     0.11.1 )

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  TAG     6.15.2 )

ecbuild_bundle_finalize()
