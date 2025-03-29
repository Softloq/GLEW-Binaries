cmake_minimum_required(VERSION 3.10)

project(GLEW-Package)

# Package glew.zip
configure_file("${CMAKE_CURRENT_LIST_DIR}/glew.cmake" "${CMAKE_BINARY_DIR}/glew-$ENV{GLEW_VERSION}/glew.cmake" COPYONLY)
configure_file("${CMAKE_CURRENT_LIST_DIR}/copy_dll.cmake" "${CMAKE_BINARY_DIR}/glew-$ENV{GLEW_VERSION}/copy_dll.cmake" COPYONLY)
add_custom_target(zip_glew ALL
    COMMAND ${CMAKE_COMMAND} -E tar cfv "${CMAKE_BINARY_DIR}/glew.zip" --format=zip .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/glew-$ENV{GLEW_VERSION}")
