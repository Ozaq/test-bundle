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

project( MarsClient LANGUAGES C CXX Fortran )

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

ecbuild_bundle_initialize()

ecbuild_set_verbose( ENABLE_PKGCONFIG OFF CACHE BOOL "PkgConfig support disabled" ) # not needed for bundle
ecbuild_set_verbose( ENABLE_PYTHON    OFF CACHE BOOL "Python disabled" )            # FIXME remove when lxg/ecgb can handle this
ecbuild_set_verbose( ENABLE_FORTRAN   OFF CACHE BOOL "Fortran option(s) disabled" ) # only fortran left for libemos

ecbuild_bundle( PROJECT eccodes         GIT "https://github.com/ecmwf/eccodes"               TAG 2.38.0   UPDATE)
ecbuild_bundle( PROJECT eckit           GIT "https://github.com/ecmwf/eckit"                 TAG 1.28.0   UPDATE)
ecbuild_bundle( PROJECT odc             GIT "https://github.com/ecmwf/odc"                   TAG 1.5.2    UPDATE)
ecbuild_bundle( PROJECT metkit          GIT "https://github.com/ecmwf/metkit"                TAG 1.11.19  UPDATE)
ecbuild_bundle( PROJECT atlas           GIT "https://github.com/ecmwf/atlas"                 TAG 0.39.0   UPDATE)
ecbuild_bundle( PROJECT atlas-orca      GIT "https://github.com/ecmwf/atlas-orca"            TAG 0.4.0    UPDATE)
ecbuild_bundle( PROJECT mir             GIT "https://github.com/ecmwf/mir"                   TAG 1.23.0   UPDATE)
ecbuild_bundle( PROJECT fdb5            GIT "https://github.com/ecmwf/fdb"                   TAG 5.13.103 UPDATE)
ecbuild_bundle( PROJECT mars-client     GIT "ssh://git@git.ecmwf.int/mars/mars-client"       TAG 6.99.3   UPDATE)

ecbuild_bundle_finalize()
