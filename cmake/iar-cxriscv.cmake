include_guard()

# Facilitate adding C-SPY tests driven by CTest
macro(iar_cspysim TARGET)
  find_program(CSPYBAT
    NAMES CSpyBat
    HINTS "${TOOLKIT_DIR}/.."
    PATH_SUFFIXES "common/bin"
    REQUIRED
  )

  cmake_path(GET CSPYBAT PARENT_PATH COMMON_DIR)

  find_library(LIBPROC
    NAMES libriscvproc.so
    HINTS ${TOOLKIT_DIR}
    PATH_SUFFIXES bin
    REQUIRED
  )
  find_library(LIBSIM
    NAMES libriscvsim.so libriscvSIM.so
    HINTS ${TOOLKIT_DIR}
    PATH_SUFFIXES bin
    REQUIRED
  )
  find_library(LIBSUPPORT
    NAMES libriscvlibsupport.so
    HINTS ${TOOLKIT_DIR}
    PATH_SUFFIXES bin
    REQUIRED
  )

  add_test(NAME ${TARGET}
    COMMAND ${CSPYBAT} ${LIBPROC} ${LIBSIM}
      --plugin=${LIBSUPPORT}
      --debug_file=$<TARGET_FILE:${TARGET}>
      --silent
      --backend
        --core=RV32IMAC
        --semihosting
  )

  # SUCCESS is the expected output from acutest
  set_property(TEST ${TARGET} PROPERTY PASS_REGULAR_EXPRESSION SUCCESS)
endmacro()

# Generate additional outputs
function(iar_elftool tgt)
  add_custom_command(TARGET ${tgt} POST_BUILD
    COMMAND ${CMAKE_IAR_ELFTOOL} --silent --strip --ihex $<TARGET_FILE:${tgt}> $<TARGET_FILE_DIR:${tgt}>/${tgt}.hex
    COMMAND ${CMAKE_IAR_ELFTOOL} --silent --strip --srec $<TARGET_FILE:${tgt}> $<TARGET_FILE_DIR:${tgt}>/${tgt}.srec
    COMMAND ${CMAKE_IAR_ELFTOOL} --silent --strip --bin  $<TARGET_FILE:${tgt}> $<TARGET_FILE_DIR:${tgt}>/${tgt}.bin
  )
endfunction()

