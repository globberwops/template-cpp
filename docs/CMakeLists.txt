find_package(Doxygen REQUIRED dot OPTIONAL_COMPONENTS mscgen dia)

set(DOXYGEN_GENERATE_HTML YES)

doxygen_add_docs(doxygen ${PROJECT_SOURCE_DIR}/include COMMENT "Generate html docs")
