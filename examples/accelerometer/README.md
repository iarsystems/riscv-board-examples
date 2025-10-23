# Accelerometer example

* Target: IAR RISC-V GD32V Evaluation Board

This project exercises the MMA8652 I2C 3-axis accelerometer mounted on this board.

## Jumper settings

To run this example, make sure that the jumpers on the evaluation board are set for the LEDs. 
The settings are __highlighted__ in the following tables: 

| __J5__         | __Position__    |  __Option__   |
| :------------- | :-------------- | :------------- |
|                | __1-2__         | __LED3__       |
|                | 2-3             | Green LED      |

| __J6__         | __Position__    |  __Option__   |
| :------------- | :-------------- | :------------- |
|                | __1-2__         | __USB/Debug__  |
|                | 2-3             | J4             |

| __J9__         | __Position__    |  __Option__   |
| :------------- | :-------------- | :------------- |
|                | 1-2             | SW5            |
|                | 3-4             | Blue LED       |
|                | __5-6__         | __LED4__       |

## Running
	
Tilt the board and watch the LED bar to toggle in accordance with the current gravitational data.
