cmake_minimum_required(VERSION 4.1.2)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(iar-cxriscv)

# Configure a CMake project
project(iar-gd32v-examples)

# Enable CTest
enable_testing()

# Enable IAR C-STAT Static Analysis
option(ENABLE_ICSTAT "Enable IAR C-STAT Static Analysis" OFF)
if(ENABLE_ICSTAT)
  set(CMAKE_C_ICSTAT "${CMAKE_IAR_CSTAT}")
  set(CMAKE_CXX_ICSTAT "${CMAKE_IAR_CSTAT}")
endif()

# Enable IAR Compiler extensions (-e)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_CXX_EXTENSIONS ON)

# Set the TOOLKIT directory
cmake_path(GET CMAKE_C_COMPILER PARENT_PATH BIN_DIR)
cmake_path(GET BIN_DIR PARENT_PATH TOOLKIT_DIR)

add_subdirectory(examples)
