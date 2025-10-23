# Temperature/Humidity sensor example

* Target: IAR RISC-V GD32V Evaluation Board

This project exercises the SHT31 I2C Temperature/Humidity sensor.

## Jumper settings
To run this example, make sure that the jumpers on the evaluation board are set to use the RGB LED. 
The settings are __highlighted__ in the following tables: 

| __J5__         | __Position__    |  __Option__    |
| :------------- | :-------------- | :------------- |
|                | 1-2             | LED3           |
|                | __2-3__         | __Green LED__  |

| __J6__         | __Position__    |  __Option__    |
| :------------- | :-------------- | :------------- |
|                | __1-2__         | __USB/Debug__  |
|                | 2-3             | J4             |

| __J8__         | __Position__    |  __Option__    |
| :------------- | :-------------- | :------------- |
|                | 1-2             | SW4            |
|                | __2-3__         | __Red LED__    |

| __J9__         | __Position__    |  __Option__    |
| :------------- | :-------------- | :------------- |
|                | 1-2             | SW5            |
|                | __3-4__         | __Blue LED__   |
|                | 5-6             | LED4           |

## Notes
Depending on the room temperature/humidity conditions, you might have to adjust the fixed point _threshold values_ be able to cross over the different _threshold levels_. You will find that _threshold values_ in the _main.c_ file are expressed by a __1000x__ factor. For example, 25°C should be expressed as `25000`. If that is the case you are facing, update these _threshold values_, rebuild the project and restart the debugging session. The tables below summarize how the _threshold levels_ changes which LED will be lit.

| __Temperature threshold__ |  __Set when data is__                                          | __Board LED__  |
| :--------------           | :-------------                                                 | :-------       |
| Low                       | below __TEMP_LOW_THRESHOLD__                                   | Blue LED       |
| Medium                    | between __TEMP_LOW_THRESHOLD__ and __TEMP_MEDIUM_THRESHOLD__   | Green LED      |
| High                      | above __TEMP_MEDIUM_THRESHOLD__                                | Red LED        |

| __Humidity threshold__    |  __Set when data is__                                          | __Board LED__  |
| :--------------           | :-------------                                                 | :--------      |
| Low                       | below __HUM_LOW_THRESHOLD__                                    | 3              |
| Medium                    | between __HUM_LOW_THRESHOLD__ and __HUM_MEDIUM_THRESHOLD__     | 3 and 2        |           
| High                      | above __HUM_MEDIUM_THRESHOLD__                                 | 3, 2 and 1     |
