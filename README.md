# Project examples for the IAR RISC-V Evaluation Board

This repository contains [application examples](examples) for the __IAR RISC-V Evaluation Board__.

### Board specifications
The IAR RISC-V Evaluation Board is a prototyping board featuring a number of peripherals as described in the list below.

<img align="right" src="docs/images/00-board.png" width=320px />

* [GD32VF103RBT6](https://www.gigadevice.com/product/mcu/main-stream-mcus/gd32vf103-series) GigaDevice RISC-V MCU
* MIPI-20 JTAG header (__J11__)
* [SPI flash](examples/spi-flash) memory
* 5x User [LEDs](examples/leds)
* 5x User [switches](examples/switches)
* [RGB LED](examples/rgb-led)
* [Potentiometer](examples/potentiometer)
* I²C 3-axis [accelerometer](examples/accelerometer)
* I²C [temperature-humidity](examples/temperature-humidity) sensors
* Light sensor
* Microphone
* 3.5mm Earbud jack
* Reset button 

The board [schematics](docs/iar-risc-v-gd32v-evaluation-board-schematics-rev3c.pdf) is readily available.

## Disclaimer
IAR shall not be held liable for any losses or problems arising from using the content provided in this repository. The software provided in this repository is released under the licenses detailed in [LICENSE.md](LICENSE.md).

## Supported Environments
The project format for the [application examples](Examples) in this repository is [CMake](https://github.com/iarsystems/cmake-tutorial). The following Development Environments are readily supported:
- [IAR Embedded Workbench for RISC-V](https://www.iar.com/embedded-development-tools/free-trials) IDE
- Microsoft Visual Studio Code with the [IAR Build Tools for RISC-V](https://iar.com/cx) and the [IAR Debug Extension](https://marketplace.visualstudio.com/items?itemName=iarsystems.iar-debug)

## Getting started
It is highly recommended you follow these guidelines.

1. Clone or download this repository to your local machine.
2. Open the CMake project (the top-level CMakeList.txt) in your preferred IDE.
3. Build the CMake project. All application examples will build.
4. Connect the board's MIPI-20  to a supported debug probe (IAR I-jet or SEGGER J-link) attached to an USB port of your local machine.
5. Debug any desired application example.

>[!TIP]
>Refer to the desired application example README.md for its specific notes and details.

## Troubleshooting
For questions or suggestions related to this repository: try the [wiki][url-repo-wiki] or check [earlier issues][url-repo-issue-old]. If those don't help, create a [new issue][url-repo-issue-new] with detailed information.

<!-- links -->
[ewriscv-url]:              https://iar.com/riscv
[url-repo]:                 https://github.com/iarsystems/riscv-board-examples
[url-repo-wiki]:            https://github.com/iarsystems/riscv-board-examples/wiki
[url-repo-issue-new]:       https://github.com/iarsystems/riscv-board-examples/issues/new
[url-repo-issue-old]:       https://github.com/iarsystems/riscv-board-examples/issues?q=is%3Aissue+is%3Aopen%7Cclosed
