include( ecmwf-local-config.cmake OPTIONAL )

# general

set( CMAKE_C_COMPILER_INIT        gcc )
set( CMAKE_CXX_COMPILER_INIT      g++ )
set( CMAKE_Fortran_COMPILER_INIT  gfortran )

set( BOOST_ROOT "/usr/local/apps/boost/1.53.0/" ) # for unit tests
