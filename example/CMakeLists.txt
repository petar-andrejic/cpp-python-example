add_library(example INTERFACE)

add_library(example::example ALIAS example)

target_compile_features(example INTERFACE cxx_std_17)

target_include_directories(example
    INTERFACE
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

install(TARGETS example EXPORT exampleTargets)

install(DIRECTORY ${PROJECT_SOURCE_DIR}/example
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR} COMPONENT headers
    PATTERN "CMakeLists.txt" EXCLUDE)