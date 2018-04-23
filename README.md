### SHELL

---

A simple shell written in verilog, running on my own CPU.

The MIPS code is in final_arrow23.s.



#### Tools

vivado 2016.2

Sword-v4



#### Support 4 instructions

- clrscr

  clear screen

- uname

  print the name of this shell on the screen

- hello

  print "Hello world" on the screen

- game

  a simple pixel game, using key A/D or ←/→ to move the board in order to catch the brick dropping from the top of the screen. Press ESC to exit.

- other input

  print "No such command" on the screen



#### Info about CPU

- 25MHz multicycle CPU
- MIPS
- supports 29 instructions:
  - add
  - addu
  - sub
  - subu
  - slt
  - sltu
  - and
  - or
  - xor
  - nor
  - srl
  - sll
  - sra
  - addi
  - addiu
  - andi
  - ori
  - xori
  - lui
  - slti
  - sltiu
  - lw
  - sw
  - jalr
  - jr
  - j
  - jal
  - beq
  - bne