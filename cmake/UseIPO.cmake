include_guard()

include(${CMAKE_CURRENT_LIST_DIR}/ProjectName.cmake)

if(${PROJECT_NAME_UPPER}_USE_IPO)
  include(CheckIPOSupported)
  check_ipo_supported(RESULT result OUTPUT output)
  if(result)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)
  else()
    message(WARNING "IPO is not supported: ${output}")
  endif()
endif()
