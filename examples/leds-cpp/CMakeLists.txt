set(EXAMPLE leds-cpp)

add_executable(${EXAMPLE} led.cpp main.cpp systick.cpp)

target_sources(${EXAMPLE} PRIVATE
  ../../bsp/i2c.c
  ../../bsp/iar-risc-v-gd32v-eval.c
  ../../bsp/MMA8652.c
  ../../GD32VF103_Firmware_Library/Firmware/GD32VF103_standard_peripheral/Source/gd32vf103_adc.c
  ../../GD32VF103_Firmware_Library/Firmware/GD32VF103_standard_peripheral/Source/gd32vf103_eclic.c
  ../../GD32VF103_Firmware_Library/Firmware/GD32VF103_standard_peripheral/Source/gd32vf103_gpio.c
  ../../GD32VF103_Firmware_Library/Firmware/GD32VF103_standard_peripheral/Source/gd32vf103_i2c.c
  ../../GD32VF103_Firmware_Library/Firmware/GD32VF103_standard_peripheral/Source/gd32vf103_rcu.c
  ../../GD32VF103_Firmware_Library/Firmware/GD32VF103_standard_peripheral/Source/gd32vf103_usart.c
  ../../GD32VF103_Firmware_Library/Firmware/RISCV/env_IAR/low_level_init.c
  ../../GD32VF103_Firmware_Library/Firmware/RISCV/drivers/n200_func.c
  ../../GD32VF103_Firmware_Library/Firmware/GD32VF103_standard_peripheral/system_gd32vf103.c
)

target_compile_definitions(${EXAMPLE} PRIVATE
  GD32VF103R_START
)

target_include_directories(${EXAMPLE} PRIVATE
  ../../GD32VF103_Firmware_Library/Firmware/GD32VF103_standard_peripheral
  ../../GD32VF103_Firmware_Library/Firmware/GD32VF103_standard_peripheral/Include
  ../../GD32VF103_Firmware_Library/Firmware/RISCV/drivers
  ../../GD32VF103_Firmware_Library/Firmware/RISCV/env_IAR
  ../../bsp
)

target_compile_options(${EXAMPLE} PRIVATE
  --core=RV32IMAC
  -e
  --no_wrap_diagnostics
  --nonportable_path_warnings
)

target_link_options(${EXAMPLE} PRIVATE
  --config /opt/iar/cxriscv/riscv/config/linker/GD/GD32VF103xB.icf
  "SHELL:--config_def CSTACK_SIZE=0x1000"
  "SHELL:--config_def HEAP_SIZE=0x1000"
  --redirect __write=__write_buffered
  --debug_lib=iar_breakpoint
  --map .
)