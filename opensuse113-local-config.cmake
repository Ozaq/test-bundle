include( ecmwf-local-config.cmake OPTIONAL )

# general

set( CMAKE_C_COMPILER_INIT        gcc )
set( CMAKE_CXX_COMPILER_INIT      g++ )
# set( CMAKE_Fortran_COMPILER_INIT  pgf90 )
set( CMAKE_Fortran_COMPILER_INIT  gfortran )

# libemos
set( ENABLE_FORTRAN90 OFF CACHE INTERNAL "" )
set( ENABLE_FORTRAN   OFF CACHE INTERNAL "" )
set( WITH_PGI_FORTRAN ON  CACHE INTERNAL "" )
