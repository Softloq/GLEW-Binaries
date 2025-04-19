add_custom_target(
    GLEW-DLL-Copy
    DEPENDS "${CMAKE_CURRENT_LIST_DIR}/__run_always"
    COMMENT "GLEW DLL Copy"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_LIST_DIR}/bin/glew.dll" "${CMAKE_BINARY_DIR}/$<CONFIG>/bin/glew.dll"
)
 
add_library(glew-all INTERFACE)
add_dependencies(glew-all GLEW-DLL-Copy)
target_include_directories(glew-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/include")
target_link_directories(glew-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/lib")
target_link_libraries(glew-all INTERFACE glew)
add_library(glew::all ALIAS glew-all)
