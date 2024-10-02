include(FetchContent)

FetchContent_Declare(
  gsl-lite
  GIT_REPOSITORY https://github.com/gsl-lite/gsl-lite.git
  GIT_TAG v0.41.0)

set(FMT_SYSTEM_HEADERS ON)
FetchContent_Declare(
  fmt
  GIT_REPOSITORY https://github.com/fmtlib/fmt.git
  GIT_TAG 11.0.2)

set(SPDLOG_SYSTEM_INCLUDES ON)
set(SPDLOG_INSTALL ON)
set(SPDLOG_FMT_EXTERNAL ON)
FetchContent_Declare(
  spdlog
  GIT_REPOSITORY https://github.com/gabime/spdlog.git
  GIT_TAG v1.14.1)

FetchContent_MakeAvailable(gsl-lite fmt spdlog)
