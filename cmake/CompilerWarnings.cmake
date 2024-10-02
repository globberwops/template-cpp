include_guard()

include(CheckCXXCompilerFlag)
check_cxx_compiler_flag(-pedantic HAS_PEDANTIC)
check_cxx_compiler_flag(-Wall HAS_WALL)
check_cxx_compiler_flag(-Wcast-align HAS_WCAST_ALIGN)
check_cxx_compiler_flag(-Wconversion HAS_WCONVERSION)
check_cxx_compiler_flag(-Wdouble-promotion HAS_WDOUBLE_PROMOTION)
check_cxx_compiler_flag(-Wduplicated-branches HAS_WDUPLICATED_BRANCHES)
check_cxx_compiler_flag(-Wduplicated-cond HAS_WDUPLICATED_COND)
check_cxx_compiler_flag(-Wextra HAS_WEXTRA)
check_cxx_compiler_flag(-Wformat=2 HAS_WFORMAT_2)
check_cxx_compiler_flag(-Wimplicit-fallthrough HAS_WIMPLICIT_FALLTHROUGH)
check_cxx_compiler_flag(-Wlifetime HAS_WLIFETIME)
check_cxx_compiler_flag(-Wlogical-op HAS_WLOGICAL_OP)
check_cxx_compiler_flag(-Wmisleading-indentation HAS_WMISLEADING_INDENTATION)
check_cxx_compiler_flag(-Wnon-virtual-dtor HAS_WNON_VIRTUAL_DTOR)
check_cxx_compiler_flag(-Wnull-dereference HAS_WNULL_DEREFERENCE)
check_cxx_compiler_flag(-Wold-style-cast HAS_WOLD_STYLE_CAST)
check_cxx_compiler_flag(-Woverloaded-virtual HAS_WOVERLOADED_VIRTUAL)
check_cxx_compiler_flag(-Wpedantic HAS_WPEDANTIC)
check_cxx_compiler_flag(-Wshadow HAS_WSHADOW)
check_cxx_compiler_flag(-Wsign-conversion HAS_WSIGN_CONVERSION)
check_cxx_compiler_flag(-Wunused HAS_WUNUSED)
check_cxx_compiler_flag(-Wuseless-cast HAS_WUSELESS_CAST)

function(TARGET_ENABLE_WARNINGS target)
  target_compile_options(
    ${target}
    PRIVATE $<$<BOOL:${HAS_PEDANTIC}>:-pedantic>
            $<$<BOOL:${HAS_WALL}>:-Wall>
            $<$<BOOL:${HAS_WCAST_ALIGN}>:-Wcast-align>
            $<$<BOOL:${HAS_WCONVERSION}>:-Wconversion>
            $<$<BOOL:${HAS_WDOUBLE_PROMOTION}>:-Wdouble-promotion>
            $<$<BOOL:${HAS_WDUPLICATED_BRANCHES}>:-Wduplicated-branches>
            $<$<BOOL:${HAS_WDUPLICATED_COND}>:-Wduplicated-cond>
            $<$<BOOL:${HAS_WEXTRA}>:-Wextra>
            $<$<BOOL:${HAS_WFORMAT_2}>:-Wformat=2>
            $<$<BOOL:${HAS_WIMPLICIT_FALLTHROUGH}>:-Wimplicit-fallthrough>
            $<$<BOOL:${HAS_WLIFETIME}>:-Wlifetime>
            $<$<BOOL:${HAS_WLOGICAL_OP}>:-Wlogical-op>
            $<$<BOOL:${HAS_WMISLEADING_INDENTATION}>:-Wmisleading-indentation>
            $<$<BOOL:${HAS_WNON_VIRTUAL_DTOR}>:-Wnon-virtual-dtor>
            $<$<BOOL:${HAS_WNULL_DEREFERENCE}>:-Wnull-dereference>
            $<$<BOOL:${HAS_WOLD_STYLE_CAST}>:-Wold-style-cast>
            $<$<BOOL:${HAS_WOVERLOADED_VIRTUAL}>:-Woverloaded-virtual>
            $<$<BOOL:${HAS_WPEDANTIC}>:-Wpedantic>
            $<$<BOOL:${HAS_WSHADOW}>:-Wshadow>
            $<$<BOOL:${HAS_WSIGN_CONVERSION}>:-Wsign-conversion>
            $<$<BOOL:${HAS_WUNUSED}>:-Wunused>
            $<$<BOOL:${HAS_WUSELESS_CAST}>:-Wuseless-cast>)
endfunction()
