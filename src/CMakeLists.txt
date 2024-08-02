project(CMAKE_STM)



# Include directories
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../inc)




# Create the firmware executable

set(SOURCES
main.cpp
)


if(CMAKE_CROSSCOMPILING)
add_executable(Firmware ${SOURCES})
target_include_directories(Firmware PRIVATE ${libopencm3_SOURCE_DIR}/include)
target_link_libraries(Firmware stm32f103)

else()
  message(STATUS "For unit tests on PC")
#  target_link_libraries(Firmware  PRIVATE dummy_libopencm3)
  add_library(my_functions my_function.cpp)
endif()
