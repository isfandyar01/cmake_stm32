include(FetchContent)

# Fetch libopencm3
FetchContent_Declare(libopencm3
  GIT_REPOSITORY https://github.com/libopencm3/libopencm3
  GIT_TAG master
)
FetchContent_MakeAvailable(libopencm3)
FetchContent_GetProperties(libopencm3)

if(NOT libopencm3_POPULATED)
  message(FATAL_ERROR "libopencm3 was not fetched properly!")
else()
  message(STATUS "libopencm3 is available.")
endif()

# Create a target to build libopencm3 for STM32F1 family
add_custom_target(libopencm3 make TARGETS=stm32/f1 WORKING_DIRECTORY ${libopencm3_SOURCE_DIR}
)


# Create a specific CPU target with the appropriate options etc.
add_library(stm32f103 STATIC IMPORTED)
set_property(TARGET stm32f103 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${libopencm3_SOURCE_DIR}/include)
set_property(TARGET stm32f103 PROPERTY IMPORTED_LOCATION ${libopencm3_SOURCE_DIR}/lib/libopencm3_stm32f1.a)
add_dependencies(stm32f103 libopencm3)
target_link_directories(stm32f103 INTERFACE ${libopencm3_SOURCE_DIR}/lib)

target_compile_definitions(stm32f103 INTERFACE -DSTM32F1)

set(COMPILE_OPTIONS 
  --static
  -nostartfiles
  -fno-common
  -mcpu=cortex-m3
  -mthumb
)
target_compile_options(stm32f103 INTERFACE ${COMPILE_OPTIONS})
target_link_options(stm32f103 INTERFACE ${COMPILE_OPTIONS})

