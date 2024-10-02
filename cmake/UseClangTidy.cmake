include_guard()

include(${CMAKE_CURRENT_LIST_DIR}/ProjectName.cmake)

if(${PROJECT_NAME_UPPER}_USE_CLANG_TIDY)
  find_program(CLANG_TIDY_PROGRAM clang-tidy-18)
  if(CLANG_TIDY_PROGRAM)
    set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_PROGRAM}")
  else()
    message(WARNING "clang-tidy not found")
  endif()
endif()
