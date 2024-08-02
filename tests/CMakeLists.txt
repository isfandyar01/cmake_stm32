project(CMAKE_STM)

## .cmake file allows configurations


enable_testing()

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../inc)
## i am setting sources with name TEST_FILES
set( TEST_FILES 
test.cpp
main.cpp)


### my executalble will be called test and files that will make it is under variable TEST_FILES
add_executable(test ${TEST_FILES})

### i need to link libraries with my executable test file those are my units under test and testframe


target_link_libraries(test PRIVATE
    my_functions
    CppUTest::CppUTest
    CppUTest::CppUTestExt)