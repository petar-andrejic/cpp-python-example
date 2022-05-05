# Configure the setup.py file
configure_file(setup.py.in ${CMAKE_CURRENT_BINARY_DIR}/setup.py)

# Create a custom target to build the python package during build stage
add_custom_target(${PKG_NAME}-setuptools ALL
    DEPENDS ${PKG_NAME}4py
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/${PKG_NAME} ${CMAKE_CURRENT_BINARY_DIR}/${PKG_NAME}
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${PKG_NAME}4py> ${CMAKE_CURRENT_BINARY_DIR}/${PKG_NAME}
    COMMAND ${PYTHON_EXECUTABLE} setup.py --quiet build --force
    COMMAND ${CMAKE_COMMAND} -E rm ${CMAKE_CURRENT_BINARY_DIR}/${PKG_NAME}/$<TARGET_FILE_NAME:${PKG_NAME}4py>
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

# Ensure the path where the python package is installed is not empty
if(NOT DEFINED ${CONF_NAME}_PYTHON_INSTALL_PREFIX)
    file(TO_NATIVE_PATH ${CMAKE_INSTALL_PREFIX} ${CONF_NAME}_PYTHON_INSTALL_PREFIX)
endif()

# Create an install target for the python package
install(CODE "execute_process(COMMAND pip install . --no-deps --force-reinstall --no-compile --prefix=${${CONF_NAME}_PYTHON_INSTALL_PREFIX} WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})")

# Helper targets for pip install and wheel building

add_custom_target(${PKG_NAME}-pip-install 
    DEPENDS ${PKG_NAME}-setuptools
    COMMAND ${PYTHON_EXECUTABLE} -m pip install . --no-deps --force-reinstall --no-compile WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
