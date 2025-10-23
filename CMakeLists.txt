cmake_minimum_required(VERSION 4.1.2)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(iar-cxriscv)

# Configure a CMake project
project(iar-gd32v-examples)
enable_testing()

add_subdirectory(examples)
