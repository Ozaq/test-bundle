# (C) Copyright 2011- ECMWF.
#
# This software is licensed under the terms of the Apache Licence Version 2.0
# which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
# In applying this licence, ECMWF does not waive the privileges and immunities
# granted to it by virtue of its status as an intergovernmental organisation nor
# does it submit to any jurisdiction.

########################################################################################################################

cmake_minimum_required( VERSION 3.12 FATAL_ERROR )

find_package( ecbuild 3.7 REQUIRED HINTS ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/../ecbuild)

project( MarsClient LANGUAGES C CXX )

########################################################################################################################

macro( ecbuild_set_verbose )
    set( ${ARGV} )
    message( STATUS "SET ${ARGV0} = ${ARGV1}" )
endmacro()

if( ECMWF )
	set(ECMWF ON)
    include( ecmwf.cmake OPTIONAL )
endif()

if( ECMWF_HPC )
	set(ECMWF ON)
	include( ecmwf-hpc-local-config.cmake OPTIONAL )
endif()

if( LOCALCONFIG )
    include( ${LOCALCONFIG} OPTIONAL )
endif()

########################################################################################################################

option(ENABLE_AEC "Enable AEC" ON)

if( ENABLE_AEC )

    # Check system AEC. If less than 1.1.1 OR not found, we build our own
    ecbuild_find_package( NAME AEC VERSION 1.1.1 )

    if (AEC_VERSION VERSION_LESS 1.1.1 OR NOT AEC_VERSION)
        message(STATUS "No suitable AEC found. Building from source.")
        set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
        set(AEC_LIBRARY "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/libaec${CMAKE_SHARED_LIBRARY_SUFFIX}")
        set(AEC_INCLUDE_DIR "${CMAKE_BINARY_DIR}/libaec/include")
        ecbuild_bundle( PROJECT libaec GIT "https://gitlab.dkrz.de/k202009/libaec.git" TAG v1.1.2 UPDATE)
    endif()

endif()

ecbuild_bundle_initialize()

ecbuild_set_verbose( ENABLE_PKGCONFIG OFF CACHE BOOL "PkgConfig support disabled" ) # not needed for bundle
ecbuild_set_verbose( ENABLE_PYTHON    OFF CACHE BOOL "Python disabled" )            # FIXME remove when lxg/ecgb can handle this

ecbuild_bundle( PROJECT eccodes         GIT "https://github.com/ecmwf/eccodes"               TAG 2.39.4   UPDATE)
ecbuild_bundle( PROJECT eckit           GIT "https://github.com/ecmwf/eckit"                 TAG 1.28.8   UPDATE)
ecbuild_bundle( PROJECT odc             GIT "https://github.com/ecmwf/odc"                   TAG 1.6.0    UPDATE)
ecbuild_bundle( PROJECT metkit          GIT "https://github.com/ecmwf/metkit"                TAG 1.13.2   UPDATE )
ecbuild_bundle( PROJECT atlas           GIT "https://github.com/ecmwf/atlas"                 TAG 0.40.0   UPDATE)
ecbuild_bundle( PROJECT atlas-orca      GIT "https://github.com/ecmwf/atlas-orca"            TAG 0.4.0    UPDATE)
ecbuild_bundle( PROJECT mir             GIT "https://github.com/ecmwf/mir"                   TAG 1.23.0   UPDATE)
ecbuild_bundle( PROJECT fdb5            GIT "https://github.com/ecmwf/fdb"                   TAG 5.16.2   UPDATE)
if ( ENABLE_AEC )
    ecbuild_bundle( PROJECT gribjump    GIT "https://github.com/ecmwf/gribjump"              TAG 0.9.3    UPDATE)
endif()
ecbuild_bundle( PROJECT mars-client-cpp GIT "git@github.com:ecmwf/mars-client-cpp.git"       BRANCH develop UPDATE)


ecbuild_bundle_finalize()
