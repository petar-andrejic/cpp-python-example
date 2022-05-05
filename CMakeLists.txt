cmake_minimum_required(VERSION 3.0)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(CCache)

set(PKG_NAME example)
set(CONF_NAME EXAMPLE)

project(${PKG_NAME} VERSION 0.1.0 LANGUAGES CXX)

add_compile_options($<$<CXX_COMPILER_ID:MSVC>:/MP>)

include(GNUInstallDirs)

include(CondaAware)

option(${CONF_NAME}_BUILD_TESTS "Enable the compilation of the test files." ON)
option(${CONF_NAME}_BUILD_PYTHON "Enable the compilation of the python bindings." ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(${PKG_NAME})

if(${CONF_NAME}_BUILD_TESTS)
    add_subdirectory(tests)
endif()

if(${CONF_NAME}_BUILD_PYTHON)
    set(PYBIND11_CPP_STANDARD -std=c++17)
    find_package(pybind11 REQUIRED)
    add_subdirectory(python)
endif()

include(${PKG_NAME}InstallCMakeConfigFiles)


