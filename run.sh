#!/bin/bash

run_unit_test() {
    echo "Running unit tests"
    cd unit_test

    rm -rf build

    mkdir build && cd build

    cmake -DCMAKE_OSX_ARCHITECTURES="x86_64;arm64" ..

    if make ; then
        echo "Start Run Tests"
        ./test_printshared
    else
        echo "Tests Failed. Please check the CMake configuration and compilation process."
    fi
}

if [ "$1" == "test" ]; then
    run_unit_test

else
    if [ -d "build" ]; then
        echo "Found build folder, removing..."
        rm -rf build
    fi

    mkdir build
    cd build

    DYLIB_NAME=simplelib
    DYLIB_FULL_NAME="lib${DYLIB_NAME}.dylib"

    echo "Dylib name is ${DYLIB_NAME}, full name is ${DYLIB_FULL_NAME}"

    cmake -DDYLIB_NAME=${DYLIB_NAME} -DCMAKE_OSX_ARCHITECTURES="x86_64;arm64" ..

    if make; then
        echo "Make Success"
    else
        echo "Build failed. Please check the CMake configuration and compilation process."
    fi

    python3 ../test.py "${DYLIB_FULL_NAME}"

fi
