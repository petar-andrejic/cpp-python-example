# Configure the setup.py file
configure_file(setup.py.in ${CMAKE_CURRENT_BINARY_DIR}/setup.py)

# Create a custom target to build the python package during build stage
add_custom_target(example-setuptools ALL
    DEPENDS example4py
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/example ${CMAKE_CURRENT_BINARY_DIR}/example
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:example4py> ${CMAKE_CURRENT_BINARY_DIR}/example
    COMMAND ${PYTHON_EXECUTABLE} setup.py --quiet build --force
    COMMAND ${CMAKE_COMMAND} -E rm ${CMAKE_CURRENT_BINARY_DIR}/example/$<TARGET_FILE_NAME:example4py>
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

# Ensure the path where the python package is installed is not empty
if(NOT DEFINED EXAMPLE_PYTHON_INSTALL_PREFIX)
    file(TO_NATIVE_PATH ${CMAKE_INSTALL_PREFIX} EXAMPLE_PYTHON_INSTALL_PREFIX)
endif()

# Create an install target for the python package
install(CODE "execute_process(COMMAND pip install . --no-deps --force-reinstall --no-compile --prefix=${EXAMPLE_PYTHON_INSTALL_PREFIX} WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})")


add_custom_target(example-pip-install 
    DEPENDS example-setuptools
    COMMAND COMMAND ${PYTHON_EXECUTABLE} -m pip install . --no-deps --force-reinstall --no-compile WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})