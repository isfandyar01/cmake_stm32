#!/bin/bash

if [ "$1" == "arm" ]; then
    BUILD_DIR="building_for_arm_cross_compiling"
    cmake -B $BUILD_DIR -DCMAKE_TOOLCHAIN_FILE=cmake/arm-none-eabi-toolchain.cmake
else
    BUILD_DIR="building_for_pc_test_only"
    cmake -B $BUILD_DIR
fi

cmake --build $BUILD_DIR

if [ "$1" != "arm" ]; then
    ./$BUILD_DIR/run_tests
else
    echo "ARM build completed. Transfer firmware.elf to your ARM device and run it there."
fi
