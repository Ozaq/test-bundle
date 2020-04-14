cmake_minimum_required( VERSION 3.1 FATAL_ERROR )

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

ecbuild_bundle( PROJECT bufrdc_tables STASH "mars/bufrdc_tables" TAG    000414 )

ecbuild_set_verbose( ENABLE_PKGCONFIG OFF CACHE BOOL "PkgConfig support disabled" ) # not needed for bundle
ecbuild_set_verbose( ENABLE_PYTHON    OFF CACHE BOOL "Python disabled" )            # FIXME remove when lxg/ecgb can handle this
ecbuild_set_verbose( ENABLE_FORTRAN   OFF CACHE BOOL "Fortran option(s) disabled" ) # only fortran left for libemos

ecbuild_bundle( PROJECT ecbuild      STASH "ecsdk/ecbuild"     TAG 3.3.0 )
ecbuild_bundle( PROJECT eccodes      STASH "eccodes/eccodes"   TAG 2.17.0 )
ecbuild_bundle( PROJECT fdb          STASH "mars/fdb_vintage"  TAG 4.10.0 )
ecbuild_bundle( PROJECT libemos      STASH "mars/libemos"      TAG 4.6.2 )
ecbuild_bundle( PROJECT eckit        STASH "ecsdk/eckit"       TAG 1.10.0 )
ecbuild_bundle( PROJECT odc          STASH "odb/odc"           TAG 1.0.3 )
ecbuild_bundle( PROJECT metkit       STASH "ecsdk/metkit"      TAG 1.4.6 )
ecbuild_bundle( PROJECT odb_api      STASH "odb/odb_api"       TAG 0.15.11 )
ecbuild_bundle( PROJECT fdb5         STASH "mars/fdb5"         TAG 5.6.0 )
ecbuild_bundle( PROJECT atlas        STASH "atlas/atlas"       TAG 0.19.2 )
ecbuild_bundle( PROJECT mir          STASH "mir/mir"           TAG 1.4.7 )
ecbuild_bundle( PROJECT mars-client  STASH "mars/mars-client"  BRANCH hotfix/6.28.1 UPDATE )

ecbuild_bundle_finalize()
