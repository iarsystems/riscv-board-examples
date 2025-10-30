# USART interrupt-driven Transmit/Receive example

* Target: IAR RISC-V GD32V Evaluation Board

## Serial Port settings
Open a __Serial Terminal Emulator__ and configure the COM port with the following settings:

| __Baud rate__ | __Data__ | __Bit Parity__ | __Stop Bit__ | __Flow Control__ |
|--------------:|---------:|---------------:|-------------:|-----------------:|
|      `115200` |      `8` |         `None` |          `1` |           `None` |

> __Note__
>
> This project example was tested with the following __Serial Virtual Terminal Emulators__
> * [PuTTY][putty-url]
> * [Tera Term][tera-term-url]
> * [Termite][termite-url] 

[putty-url]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html 
[tera-term-url]: https://ttssh2.osdn.jp/index.html.en
[termite-url]: https://www.compuphase.com/software_termite.htm

## Running
The serial USART example is a mini word game where the serial terminal emulator should display a welcome message followed by a request to type a randomly selected fruit:
```
---
USART example

Type: kiwi
.█
```
Each character typed into the serial terminal, a __dot__  will echo as visual feedback. If there is any mistype within the expected word, the game will provide the opportunity to retry:
```
---
USART example

Type: kiwi
........
Try again!
█
```

Once the whole word has been correctly typed, a new round starts automatically with the next word to be typed:
```
---
USART example

Type: kiwi
........
Try again!
....
Well done!

Type: papaya
█
```

The game runs on an infinite superloop and only ends when the board has been powered off.