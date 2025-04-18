if(WIN32)
    # Which compilers to use for C and C++, and location of target
    # environment.
    execute_process(COMMAND uname -m OUTPUT_VARIABLE ARCH)
    message("ARCH IS ${ARCH} and PROCESSOR ${CMAKE_SYSTEM_PROCESSOR}")
    if( ${ARCH} EQUAL "x86_64")
        # First look in standard location as used by Debian/Ubuntu/etc.
        set(MINGW_ROOT /mingw64)
        message("64 bit!")
    else()
        # First look in standard location as used by Debian/Ubuntu/etc.
        set(MINGW_ROOT /mingw32)
        message("32 bit")

    endif( )

    SET(Open_BLAS_INCLUDE_SEARCH_PATHS
            ${MINGW_ROOT}/include
            )

    SET(Open_BLAS_LIB_SEARCH_PATHS
            ${MINGW_ROOT}/lib/
            )
    message("CMAKE MINGW ROOT ${MINGW_ROOT}")

else()
    SET(Open_BLAS_INCLUDE_SEARCH_PATHS
            /usr/include
            /usr/include/openblas
            /usr/include/openblas-base
            /usr/local/include
            /usr/local/include/openblas
            /usr/local/include/openblas-base
            /usr/local/opt/openblas/include
            /opt/OpenBLAS/include
            )

    if(NOT DEFINED ENV{IN_NIX_SHELL} AND NOT DEFINED ENV{CONDA_PREFIX} AND DEFINED ENV{HOMEBREW_PREFIX})
      list(APPEND Open_BLAS_INCLUDE_SEARCH_PATHS "$ENV{HOMEBREW_PREFIX}/opt/openblas/include")
    endif()

    SET(Open_BLAS_LIB_SEARCH_PATHS
            /lib/
            /lib/openblas-base
            /lib64/
            /usr/lib
            /usr/lib/openblas-base
            /usr/lib64
            /usr/local/lib
            /usr/local/lib64
            /usr/local/opt/openblas/lib
            /opt/OpenBLAS/lib
            )
    if(NOT DEFINED ENV{IN_NIX_SHELL} AND NOT DEFINED ENV{CONDA_PREFIX} AND DEFINED ENV{HOMEBREW_PREFIX})
      list(APPEND Open_BLAS_LIB_SEARCH_PATHS "$ENV{HOMEBREW_PREFIX}/opt/openblas/lib")
    endif()
endif()

FIND_PATH(OpenBLAS_INCLUDE_DIR NAMES cblas.h PATHS ${Open_BLAS_INCLUDE_SEARCH_PATHS})
FIND_LIBRARY(OpenBLAS_LIB NAMES openblas PATHS ${Open_BLAS_LIB_SEARCH_PATHS})

SET(OpenBLAS_FOUND ON)

#    Check include files
IF(NOT OpenBLAS_INCLUDE_DIR)
    SET(OpenBLAS_FOUND OFF)
    MESSAGE(STATUS "Could not find OpenBLAS include. Turning OpenBLAS_FOUND off")
ENDIF()

#    Check libraries
IF(NOT OpenBLAS_LIB)
    SET(OpenBLAS_FOUND OFF)
    MESSAGE(STATUS "Could not find OpenBLAS lib. Turning OpenBLAS_FOUND off")
ENDIF()

IF (OpenBLAS_FOUND)
    IF (NOT OpenBLAS_FIND_QUIETLY)
        MESSAGE(STATUS "Found OpenBLAS libraries: ${OpenBLAS_LIB}")
        MESSAGE(STATUS "Found OpenBLAS include: ${OpenBLAS_INCLUDE_DIR}")
    ENDIF (NOT OpenBLAS_FIND_QUIETLY)
ELSE (OpenBLAS_FOUND)
    IF (OpenBLAS_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find OpenBLAS")
    ENDIF (OpenBLAS_FIND_REQUIRED)
ENDIF (OpenBLAS_FOUND)

MARK_AS_ADVANCED(
        OpenBLAS_INCLUDE_DIR
        OpenBLAS_LIB
        OpenBLAS
)