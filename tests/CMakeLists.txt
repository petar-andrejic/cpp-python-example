find_package(Catch2 REQUIRED)

file(GLOB_RECURSE TEST_FILES "*.test.cpp")
add_executable(example-cpptests main.cpp ${TEST_FILES})
target_link_libraries(example-cpptests example::example Catch2::Catch2)
set_target_properties(example-cpptests PROPERTIES CXX_STANDARD 17 CXX_STANDARD_REQUIRED ON CXX_EXTENSIONS OFF)

add_custom_target(tests
    COMMENT "Running C++ tests..."
    COMMAND $<TARGET_FILE:example-cpptests>
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR})