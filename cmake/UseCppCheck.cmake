include_guard()

include(${CMAKE_CURRENT_LIST_DIR}/ProjectName.cmake)

if(${PROJECT_NAME_UPPER}_USE_CPPCHECK)
  find_program(CPPCHECK_PROGRAM cppcheck)
  if(CPPCHECK_PROGRAM)
    set(CMAKE_CXX_CPPCHECK "${CPPCHECK_PROGRAM}")
  else()
    message(WARNING "cppcheck not found")
  endif()
endif()
