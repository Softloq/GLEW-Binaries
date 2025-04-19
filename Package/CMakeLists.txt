cmake_minimum_required(VERSION 3.10)

project(GLEW-Package)

# Package glew.zip
configure_file("${CMAKE_CURRENT_LIST_DIR}/config.cmake" "${CMAKE_BINARY_DIR}/glew-${GLEW_VERSION}/config.cmake" COPYONLY)
add_custom_target(
    zip_glew ALL
    COMMAND ${CMAKE_COMMAND} -E tar cfv "${CMAKE_BINARY_DIR}/${PACKAGE_NAME}" --format=zip .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/glew-${GLEW_VERSION}"
)
