# The path where cmake config files are installed
set(EXAMPLE_INSTALL_CONFIGDIR ${CMAKE_INSTALL_LIBDIR}/cmake/example)

install(EXPORT exampleTargets
    FILE exampleTargets.cmake
    NAMESPACE example::
    DESTINATION ${EXAMPLE_INSTALL_CONFIGDIR}
    COMPONENT cmake)

include(CMakePackageConfigHelpers)

write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/exampleConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion)

configure_package_config_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/exampleConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/exampleConfig.cmake
    INSTALL_DESTINATION ${EXAMPLE_INSTALL_CONFIGDIR}
    PATH_VARS EXAMPLE_INSTALL_CONFIGDIR)

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/exampleConfig.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/exampleConfigVersion.cmake
    DESTINATION ${EXAMPLE_INSTALL_CONFIGDIR})