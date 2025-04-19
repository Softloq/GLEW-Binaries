cmake_minimum_required(VERSION 3.10)

project(GLEW-Compile)

# Compile GLEW
# Add GLEW source directory
add_library(glew SHARED "${CMAKE_BINARY_DIR}/../Prerequisite/Downloads/glew-${GLEW_VERSION}/src/glew.c")

# Define include directories
target_include_directories(glew PUBLIC "${CMAKE_BINARY_DIR}/../Prerequisite/Downloads/glew-${GLEW_VERSION}/include")

# Define preprocessor macro for building the shared library
target_compile_definitions(glew PRIVATE GLEW_BUILD)

# Find OpenGL (if needed)
find_package(OpenGL REQUIRED)
target_link_libraries(glew PUBLIC OpenGL::GL)

# Installation rules
install(
    TARGETS glew
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)
install(DIRECTORY "${CMAKE_BINARY_DIR}/../Prerequisite/Downloads/glew-${GLEW_VERSION}/include/GL" DESTINATION include)
