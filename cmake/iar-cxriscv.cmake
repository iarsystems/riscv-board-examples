include_guard()

# Set CMake for cross-compiling
set(CMAKE_SYSTEM_NAME Generic)

# Enable all CMake default build configurations
list(APPEND CMAKE_CONFIGURATION_TYPES Debug)
list(APPEND CMAKE_CONFIGURATION_TYPES Release)
list(APPEND CMAKE_CONFIGURATION_TYPES RelWithDebInfo)
list(APPEND CMAKE_CONFIGURATION_TYPES MinSizeRel)

# Add IAR C/C++ Compiler custom configuration for High Speed
list(APPEND CMAKE_CONFIGURATION_TYPES HighSpeed)
set(CMAKE_C_FLAGS_HIGHSPEED " -Ohs" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS_HIGHSPEED " -Ohs" CACHE INTERNAL "")

# Add IAR C/C++ Compiler custom configuration for Maximum Speed
list(APPEND CMAKE_CONFIGURATION_TYPES MaxSpeed)
set(CMAKE_C_FLAGS_MAXSPEED " -Ohs --no_size_constraints" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS_MAXSPEED " -Ohs --no_size_constraints" CACHE INTERNAL "")

# Enable IAR C-STAT Static Analysis
option(ENABLE_ICSTAT "Enable IAR C-STAT Static Analysis" OFF)
if(ENABLE_ICSTAT)
  set(CMAKE_C_ICSTAT "${CMAKE_IAR_CSTAT}")
  set(CMAKE_CXX_ICSTAT "${CMAKE_IAR_CSTAT}")
endif()

# Facilitate adding C-SPY tests driven by CTest
macro(iar_cspysim TARGET)
  find_program(CSPYBAT
    NAMES CSpyBat
    HINTS /opt/iar/cxriscv /opt/iarsystems/bxriscv
    PATH_SUFFIXES common/bin
    REQUIRED
  )
  cmake_path(GET CSPYBAT PARENT_PATH COMMON_DIR)

  find_library(LIBPROC
    NAMES libriscvproc.so
    HINTS /opt/iar/cxriscv /opt/iarsystems/bxriscv
    PATH_SUFFIXES riscv/bin
    REQUIRED
  )
  find_library(LIBSIM
    NAMES libriscvsim.so libriscvSIM.so
    HINTS /opt/iar/cxriscv /opt/iarsystems/bxriscv
    PATH_SUFFIXES riscv/bin
    REQUIRED
  )
  find_library(LIBSUPPORT
    NAMES libriscvlibsupport.so
    HINTS /opt/iar/cxriscv /opt/iarsystems/bxriscv
    PATH_SUFFIXES riscv/bin
    REQUIRED
  )

  add_test(
    NAME ${TARGET}
    COMMAND ${CSPYBAT} ${LIBPROC} ${LIBSIM}
      --plugin=${LIBSUPPORT}
      --debug_file=$<TARGET_FILE:${TARGET}>
      --silent
      --backend
        --core=RV32IMAC
        --semihosting )
  # SUCCESS is the expected output from acutest
  set_property(TEST ${TARGET} PROPERTY PASS_REGULAR_EXPRESSION SUCCESS)
endmacro()

# Generate additional outputs
function(iar_elftool tgt)
  add_custom_command(TARGET ${tgt} POST_BUILD
    COMMAND ${CMAKE_IAR_ELFTOOL} --silent --strip --ihex $<TARGET_FILE:${tgt}> $<CONFIG>/$<TARGET_PROPERTY:${tgt},NAME>.hex
    COMMAND ${CMAKE_IAR_ELFTOOL} --silent --strip --srec $<TARGET_FILE:${tgt}> $<CONFIG>/$<TARGET_PROPERTY:${tgt},NAME>.srec
    COMMAND ${CMAKE_IAR_ELFTOOL} --silent --strip --bin $<TARGET_FILE:${tgt}> $<CONFIG>/$<TARGET_PROPERTY:${tgt},NAME>.bin
)
endfunction()

# Touch the cachedVariables from CMakePresets
set(TOOLKIT_DIR ${TOOLKIT_DIR})
set(SELECTED_TOOL ${SELECTED_TOOL})
