cmake_minimum_required(VERSION 3.0)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(CCache)

project(example VERSION 0.1.0 LANGUAGES CXX)

add_compile_options($<$<CXX_COMPILER_ID:MSVC>:/MP>)

include(GNUInstallDirs)

include(CondaAware)


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(example)

set(PYBIND11_CPP_STANDARD -std=c++17)
find_package(pybind11 REQUIRED)
add_subdirectory(python)

include(exampleInstallCMakeConfigFiles)


