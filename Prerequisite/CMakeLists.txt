cmake_minimum_required(VERSION 3.10)

project(GLEW-Prerequisite)

# Download GLEW
if(NOT EXISTS "${CMAKE_BINARY_DIR}/Downloads/glew-${GLEW_VERSION}.zip")
    file(DOWNLOAD "https://sourceforge.net/projects/glew/files/glew/${GLEW_VERSION}/glew-${GLEW_VERSION}.zip/download" "${CMAKE_BINARY_DIR}/Downloads/glew-${GLEW_VERSION}.zip" SHOW_PROGRESS)
endif()
if(NOT EXISTS "${CMAKE_BINARY_DIR}/Downloads/glew-${GLEW_VERSION}")
    file(ARCHIVE_EXTRACT INPUT "${CMAKE_BINARY_DIR}/Downloads/glew-${GLEW_VERSION}.zip" DESTINATION "${CMAKE_BINARY_DIR}/Downloads")
endif()
