#include <CppUTest/TestHarness.h>
#include "my_function.hpp"

TEST_GROUP(MyFunctionsGroup){
    void setup(){
        // setup code, if needed
    }

    void teardown(){
        // teardown code, if needed
    }};

TEST(MyFunctionsGroup, AddTest)
{
    CHECK_EQUAL(5, add(2, 3));
    CHECK_EQUAL(0, add(-1, 1));
    CHECK_EQUAL(-3, add(-1, -2));
}
