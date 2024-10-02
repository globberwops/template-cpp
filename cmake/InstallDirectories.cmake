include_guard()

include(${CMAKE_CURRENT_LIST_DIR}/ProjectName.cmake)
include(GNUInstallDirs)

set(${PROJECT_NAME_UPPER}_INSTALL_BINDIR
    ${CMAKE_INSTALL_BINDIR}
    CACHE STRING "Installation directory for executables")

set(${PROJECT_NAME_UPPER}_INSTALL_LIBDIR
    ${CMAKE_INSTALL_LIBDIR}
    CACHE STRING "Installation directory for libraries")

set(${PROJECT_NAME_UPPER}_INSTALL_INCLUDEDIR
    ${CMAKE_INSTALL_INCLUDEDIR}
    CACHE STRING "Installation directory for headers")

set(${PROJECT_NAME_UPPER}_INSTALL_CONFIG_DIR
    ${${PROJECT_NAME_UPPER}_INSTALL_LIBDIR}/cmake/vdlab
    CACHE STRING "Installation directory for CMake package config files")
