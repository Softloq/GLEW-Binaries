#!/bin/bash

(
    source .env
    SCRIPT_DIR=$(readlink -f $(dirname "$0"))
    
    cmake -S $SCRIPT_DIR/Prerequisite -B $SCRIPT_DIR/build/Prerequisite -DGLEW_VERSION="$GLEW_VERSION"
    cmake --build $SCRIPT_DIR/build/Prerequisite

    cmake -S $SCRIPT_DIR/Compile -B $SCRIPT_DIR/build/Compile -DGLEW_VERSION="$GLEW_VERSION" -G"Unix Makefiles" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON
    cmake --build $SCRIPT_DIR/build/Compile  --config Release
    cmake --install $SCRIPT_DIR/build/Compile --prefix $SCRIPT_DIR/build/Package/glew-$GLEW_VERSION

    cmake -S $SCRIPT_DIR/Package -B $SCRIPT_DIR/build/Package -DGLEW_VERSION="$GLEW_VERSION" -DPACKAGE_NAME="glew-linux-clang.zip"
    cmake --build $SCRIPT_DIR/build/Package
)
