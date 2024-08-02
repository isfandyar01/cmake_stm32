# Define the system name and processor architecture
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Specify the cross compiler
set(CMAKE_C_COMPILER /usr/bin/arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/arm-none-eabi-g++)

# Specify the path to the linker
set(CMAKE_ASM_COMPILER /usr/bin/arm-none-eabi-gcc)
set(CMAKE_OBJCOPY /usr/bin/arm-none-eabi-objcopy)

# Specify the toolchain prefix
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Set compiler flags for ARM Cortex-M3
set(CMAKE_C_FLAGS "-mcpu=cortex-m3 -mthumb -O2 -g")
set(CMAKE_CXX_FLAGS "-mcpu=cortex-m3 -mthumb -O2 -g")
set(CMAKE_EXE_LINKER_FLAGS "-mcpu=cortex-m3 -mthumb -T${CMAKE_SOURCE_DIR}/stm32f103rb.ld -Wl,--gc-sections")

# Specify where to find the toolchain utilities
set(CMAKE_FIND_ROOT_PATH /usr/arm-none-eabi)


set(CMAKE_EXECUTABLE_SUFFIX_C   .elf)
set(CMAKE_EXECUTABLE_SUFFIX_CXX .elf)
set(CMAKE_EXECUTABLE_SUFFIX_ASM .elf)


# Set search path to avoid host system paths
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
