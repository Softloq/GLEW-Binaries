add_custom_target(
    GLEW_Copy_DLLs
    ALL DEPENDS ${ALL_TARGETS}
    COMMAND "${CMAKE_COMMAND}" -E make_directory "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$<CONFIG>"
    COMMAND "${CMAKE_COMMAND}" -E copy "${CMAKE_CURRENT_LIST_DIR}/bin/glew.dll" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$<CONFIG>"
)

add_library(glew-all INTERFACE)
add_library(glew::all ALIAS glew-all)
target_include_directories(glew-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/include")
target_link_directories(glew-all INTERFACE "${CMAKE_CURRENT_LIST_DIR}/lib")
target_link_libraries(glew-all INTERFACE glew)