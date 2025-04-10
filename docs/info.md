<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a Synchronous FIFO (First-In-First-Out) buffer using Verilog. It consists of a 16-slot memory array, where each slot can hold a 32-bit word. The FIFO operates on a single clock (clk) and uses two pointers—WR_PTR for writing data and RD_PTR for reading data. When the write enable (WR_EN) is active and the FIFO is not full, data from d_in is written into the memory at the current write pointer location, and the pointer is incremented. Similarly, when the read enable (RD_EN) is active and the FIFO is not empty, data is read from the memory at the current read pointer location and output through d_out, after which the read pointer is incremented. The FIFO also has two status signals: FULL, which indicates when the memory is completely filled and no more data can be written, and EMPTY, which signals when there is no data left to read. The FIFO supports circular addressing, meaning that once the pointers reach the end of the memory, they wrap around to the beginning, making efficient use of space.



## How to test

This project implements a Synchronous FIFO (First-In-First-Out) buffer using Verilog. It consists of a 16-slot memory array, where each slot can hold a 32-bit word. The FIFO operates on a single clock (clk) and uses two pointers—WR_PTR for writing data and RD_PTR for reading data. When the write enable (WR_EN) is active and the FIFO is not full, data from d_in is written into the memory at the current write pointer location, and the pointer is incremented. Similarly, when the read enable (RD_EN) is active and the FIFO is not empty, data is read from the memory at the current read pointer location and output through d_out, after which the read pointer is incremented. The FIFO also has two status signals: FULL, which indicates when the memory is completely filled and no more data can be written, and EMPTY, which signals when there is no data left to read. The FIFO supports circular addressing, meaning that once the pointers reach the end of the memory, they wrap around to the beginning, making efficient use of space.


## External hardware
it can be tested by using verilog test bench

