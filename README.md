This project integrates a quadrature decoder to interpret signals from rotary encoders, enabling precise control inputs for arcade games. 
In the context of Pong, such a decoder translates the rotational movement of a knob or encoder into digital signals that control the paddle's position on the screen.

# Technical Implementation

• The .srcs directory likely contains Verilog modules responsible for the quadrature decoding logic and game mechanics.

• .sim directory suggests the presence of simulation setups, possibly using Xilinx's XSIM, to test and validate the design.

• Files like .xpr and directories such as .gen and .hw indicate that the project was developed using Xilinx Vivado, a popular FPGA design suite.

# 📁 tb_bram.v: Testbench for Block RAM (BRAM)

This file is a testbench module for verifying the behavior of a custom BRAM module. Key features:

• Parameters:

RAM_WIDTH = 32: Width of each memory word.

RAM_ADDR_BITS = 9: 512-word addressable space.

• Inputs/Regs:

clk: Clock signal (5 ns period toggle).

ram_enable, write_enable: Control signals for BRAM access.

address, input_data: Used to simulate write operations.

Square position registers (e.g., sq_c_x1, sq_d1_y2): Likely related to game object coordinates.

• Behavior:

Instantiates the bram module with specific parameters.

Generates a clock.

Runs a loop to write values into BRAM.

This testbench sets up and simulates writing data to BRAM which likely stores pixel or game-object data.

# 📁 Nexys-A7-100T-Master.xdc: FPGA Constraints File

This file maps FPGA physical pins to logical ports in your design, tailored for the Nexys A7-100T board.

• Key Mappings:

Clock: clk is mapped to pin W5.

VGA Output: RGB and sync signals (e.g., vga_R, vga_G, vga_h_sync) are mapped to appropriate FPGA pins.

• Quadrature Inputs:

quadA → pin B18

quadB → pin A18

This confirms the use of rotary encoders, where quadA and quadB are the two signals typically used to detect direction and rotation amount in quadrature encoding.

# 🧠 Summary of the Full Systems

• Use rotary encoder signals to control paddle movement in a game like Pong.

• Decode quadrature signals using FPGA logic (implemented in Verilog).

• Drive VGA output for gameplay display.

• Use BRAM to store graphics/game states like paddle and ball coordinates.


https://github.com/user-attachments/assets/e2488d4e-2e28-4f93-bf20-152b5906e448

https://github.com/user-attachments/assets/7a9485fe-1002-4c97-9986-d5dbdf74e7fe
