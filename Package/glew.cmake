add_custom_target(
    Copy_GLEW_DLLs
    COMMENT "Copying GLEW DLLs"
    COMMAND ${CMAKE_COMMAND}
        -DCopyPath="${CMAKE_BINARY_DIR}/$<CONFIG>/bin"
        -P "${CMAKE_CURRENT_LIST_DIR}/copy_dll.cmake")

add_library(glew-all INTERFACE)
add_library(glew::all ALIAS glew-all)
target_include_directories(glew-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/include")
target_link_directories(glew-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/lib")
target_link_libraries(glew-all INTERFACE glew)