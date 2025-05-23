add_library(glew-all INTERFACE)
target_include_directories(glew-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/include")
target_link_directories(glew-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/lib")
target_link_libraries(glew-all INTERFACE glew)
add_library(glew::all ALIAS glew-all)

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    add_custom_target(
        Copy-GLEW-DLL
        COMMENT "Copy GLEW DLL"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_LIST_DIR}/bin/glew.dll" "${CMAKE_BINARY_DIR}/$<CONFIG>/bin/glew.dll"
    )
    add_dependencies(glew-all Copy-GLEW-DLL)
endif()
find_package(OpenGL REQUIRED)
