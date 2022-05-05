# Collect all source files from the current directory for the Python module
file(GLOB_RECURSE CPP_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cpp)

# Compile cpp files into a Python module
pybind11_add_module(example4py ${CPP_FILES})

# Add the root directory of the project to the include list
target_include_directories(example4py PRIVATE ${PROJECT_SOURCE_DIR})

# Link against C++ library
target_link_libraries(example4py LINK_PRIVATE example::example)