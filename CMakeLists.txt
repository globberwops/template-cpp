cmake_minimum_required(VERSION 3.28.0)

project(
  template-cpp
  VERSION 0.1.0
  DESCRIPTION "A template for C++ projects"
  HOMEPAGE_URL "https://github.com/globberwops/template-cpp"
  LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
include(ProjectName)

option(BUILD_SHARED_LIBS "Build using shared libraries" ON)
option(${PROJECT_NAME_UPPER}_ENABLE_DOCS "Enable Docs" ${PROJECT_IS_TOP_LEVEL})
option(${PROJECT_NAME_UPPER}_ENABLE_INSTALL "Enable Install" ${PROJECT_IS_TOP_LEVEL})
option(${PROJECT_NAME_UPPER}_ENABLE_TESTING "Enable Testing" ${PROJECT_IS_TOP_LEVEL})
option(${PROJECT_NAME_UPPER}_USE_CCACHE "Use ccache" ${PROJECT_IS_TOP_LEVEL})
option(${PROJECT_NAME_UPPER}_USE_CLANG_TIDY "Use clang-tidy" ${PROJECT_IS_TOP_LEVEL})
option(${PROJECT_NAME_UPPER}_USE_CPPCHECK "Use cppcheck" ${PROJECT_IS_TOP_LEVEL})
option(${PROJECT_NAME_UPPER}_USE_IPO "Use interprocedural optimization" ${PROJECT_IS_TOP_LEVEL})
option(${PROJECT_NAME_UPPER}_USE_SANITIZERS "Use sanitizers" ${PROJECT_IS_TOP_LEVEL})

include(CompilerWarnings)
include(InstallDirectories)
include(OutputDirectories)
include(UseCcache)
include(UseClangTidy)
include(UseCppCheck)
include(UseIPO)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_VERIFY_INTERFACE_HEADER_SETS ON)

add_subdirectory(external SYSTEM)
add_subdirectory(src)

if(${PROJECT_NAME_UPPER}_ENABLE_BENCHMARK)
  add_subdirectory(benchmark)
endif()

if(${PROJECT_NAME_UPPER}_ENABLE_DOCS)
  add_subdirectory(docs)
endif()

if(${PROJECT_NAME_UPPER}_ENABLE_INSTALL)
  include(CMakePackageConfigHelpers)
  include(GetAllTargets)

  get_all_targets(${PROJECT_NAME_UPPER}_TARGETS src)

  message(STATUS "Targets: ${${PROJECT_NAME_UPPER}_TARGETS}")

  install(
    TARGETS ${${PROJECT_NAME_UPPER}_TARGETS}
    EXPORT ${PROJECT_NAME_LOWER}-targets
    LIBRARY DESTINATION ${${PROJECT_NAME_UPPER}_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${${PROJECT_NAME_UPPER}_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${${PROJECT_NAME_UPPER}_INSTALL_BINDIR}
    INCLUDES
    DESTINATION ${${PROJECT_NAME_UPPER}_INSTALL_INCLUDEDIR})

  install(
    EXPORT ${PROJECT_NAME_LOWER}-targets
    FILE ${PROJECT_NAME_LOWER}-targets.cmake
    NAMESPACE ${PROJECT_NAME_LOWER}::
    DESTINATION ${${PROJECT_NAME_UPPER}_INSTALL_CONFIG_DIR})

  configure_package_config_file(
    cmake/package-config.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_LOWER}-config.cmake
    INSTALL_DESTINATION ${${PROJECT_NAME_UPPER}_INSTALL_CONFIG_DIR})

  write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_LOWER}-config-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion)

  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_LOWER}-config.cmake
                ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_LOWER}-config-version.cmake
          DESTINATION ${${PROJECT_NAME_UPPER}_INSTALL_CONFIG_DIR})

  install(DIRECTORY include/${PROJECT_NAME_LOWER} DESTINATION ${${PROJECT_NAME_UPPER}_INSTALL_INCLUDEDIR})
endif()

if(${PROJECT_NAME_UPPER}_ENABLE_TESTING)
  enable_testing()
  add_subdirectory(tests)
endif()
