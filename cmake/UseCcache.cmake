include_guard()

include(${CMAKE_CURRENT_LIST_DIR}/ProjectName.cmake)

if(${PROJECT_NAME_UPPER}_USE_CCACHE)
  find_program(CCACHE_PROGRAM ccache)
  if(CCACHE_PROGRAM)
    set(CMAKE_CXX_COMPILER_LAUNCHER "${CCACHE_PROGRAM}")
  else()
    message(WARNING "ccache not found")
  endif()
endif()
