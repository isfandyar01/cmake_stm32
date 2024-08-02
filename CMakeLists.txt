cmake_minimum_required(VERSION 3.22)

# Define the project

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(CMAKE_STM C CXX)



if(CMAKE_CROSSCOMPILING)
        message(STATUS "Cross compiling for board...")

        # Here goes the code from the previous episodes
        include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/openlibcm.cmake)


else()
        message(STATUS "Compiling for PC...")

        # Here goes the code to build the unit tests
        # See below :)
        include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/cppu_test.cmake)
        add_subdirectory(tests)
endif()

add_subdirectory(inc)
add_subdirectory(src)

