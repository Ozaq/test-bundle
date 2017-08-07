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

ecbuild_bundle( PROJECT bufrdc_tables STASH "mars/bufrdc_tables" TAG  000411 )
ecbuild_bundle( PROJECT ecbuild       STASH "ecsdk/ecbuild"      TAG  2.7.1 )

ecbuild_set_verbose( ENABLE_PYTHON OFF CACHE BOOL "Python disabled" )  # FIXME remove when lxg/ecgb can handle this
ecbuild_add_option( FEATURE ECCODES DESCRIPTION "" DEFAULT ON )

if( HAVE_ECCODES )
    ecbuild_bundle( PROJECT eccodes      STASH "eccodes/eccodes" TAG 3db2ef4605bb4ab0014f9107459859fd78f332f1 ) # current hotfix/2.4.1
else()
    ecbuild_bundle( PROJECT grib_api     STASH "grib/grib_api"   TAG BRANCH develop )  # not used
endif()


ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG 274fefabdc354f6fed37d6ca8aec22ed7fde0b86 )  # ahead of 4.8.4
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG 0ce0e62bd2e2d79175f9e08b808c5308c95e541f )  # ahead of 0.17.0
ecbuild_bundle( PROJECT fckit        STASH "ecsdk/fckit"       TAG 4c173cea26d6e2c229a993f97a56abd38397df20 )  # ahead of 0.3.3
ecbuild_bundle( PROJECT transi       STASH "atlas/transi"      TAG eed8e758fae83ef7c985117d60722971e3db985e )  # ahead of 0.3.3
ecbuild_bundle( PROJECT atlas        STASH "atlas/atlas"       TAG f6d7e64b6249ed3f8d49c93a3720c07e69cdb097 )  # ahead of 0.11.0
ecbuild_bundle( PROJECT mir          STASH "mir/mir"           TAG 0.7.8 )

ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      TAG 80b2beb514bfea59cc2dba950ab82818caf7ae2f )  # ahead of 0.6.0
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG 0.17.1 )

ecbuild_add_option( FEATURE FDB5 DESCRIPTION "" DEFAULT OFF )

if( HAVE_FDB5 )
    ecbuild_bundle( PROJECT mars-server  STASH "mars/mars-server"  TAG dc5f3ed1163a624d1cc6cae22357f441bb3beeb1 )
endif()

ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH  feature/mir UPDATE )

ecbuild_bundle_finalize()
