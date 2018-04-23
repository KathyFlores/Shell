main:
lui $3, 0x000c # vram space: 000c0000 - 000cffff
lui $4, 0xd000 # i/o space: d0000000 - dfffffff
addi $8, $0, 0xf0

read_kbd1:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, read_kbd1 # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
# $6:input data
# $7:makecode
# $8:f0
# $9:ascii

# make code:
beq $6, $8, lock

A_makecode:
addi $7, $0, 0x1c
addi $9, $0, 0x41
beq $6, $7, print
B_makecode:
addi $7, $0, 0x32
addi $9, $0, 0x42
beq $6, $7, print
C_makecode:
addi $7, $0, 0x21
addi $9, $0, 0x43
beq $6, $7, print
D_makecode:
addi $7, $0, 0x23
addi $9, $0, 0x44
beq $6, $7, print
E_makecode:
addi $7, $0, 0x24
addi $9, $0, 0x45
beq $6, $7, print
F_makecode:
addi $7, $0, 0x2B
addi $9, $0, 0x46
beq $6, $7, print
G_makecode:
addi $7, $0, 0x34
addi $9, $0, 0x47
beq $6, $7, print
H_makecode:
addi $7, $0, 0x33
addi $9, $0, 0x48
beq $6, $7, print
I_makecode:
addi $7, $0, 0x43
addi $9, $0, 0x49
beq $6, $7, print
J_makecode:
addi $7, $0, 0x3B
addi $9, $0, 0x4A
beq $6, $7, print
K_makecode:
addi $7, $0, 0x42
addi $9, $0, 0x4B
beq $6, $7, print
L_makecode:
addi $7, $0, 0x4B
addi $9, $0, 0x4C
beq $6, $7, print
M_makecode:
addi $7, $0, 0x3A
addi $9, $0, 0x4D
beq $6, $7, print
N_makecode:
addi $7, $0, 0x31
addi $9, $0, 0x4E
beq $6, $7, print
O_makecode:
addi $7, $0, 0x44
addi $9, $0, 0x4F
beq $6, $7, print
P_makecode:
addi $7, $0, 0x4D
addi $9, $0, 0x50
beq $6, $7, print
Q_makecode:
addi $7, $0, 0x15
addi $9, $0, 0x51
beq $6, $7, print
R_makecode:
addi $7, $0, 0x2D
addi $9, $0, 0x52
beq $6, $7, print
S_makecode:
addi $7, $0, 0x1B
addi $9, $0, 0x53
beq $6, $7, print
T_makecode:
addi $7, $0, 0x2C
addi $9, $0, 0x54
beq $6, $7, print
U_makecode:
addi $7, $0, 0x3C
addi $9, $0, 0x55
beq $6, $7, print
V_makecode:
addi $7, $0, 0x2A
addi $9, $0, 0x56
beq $6, $7, print
W_makecode:
addi $7, $0, 0x1D
addi $9, $0, 0x57
beq $6, $7, print
X_makecode:
addi $7, $0, 0x22
addi $9, $0, 0x58
beq $6, $7, print
Y_makecode:
addi $7, $0, 0x35
addi $9, $0, 0x59
beq $6, $7, print
Z_makecode:
addi $7, $0, 0x1A
addi $9, $0, 0x5A
beq $6, $7, print
d0_makecode:
addi $7, $0, 0x45
addi $9, $0, 0x30
beq $6, $7, print
d1_makecode:
addi $7, $0, 0x16
addi $9, $0, 0x31
beq $6, $7, print
d2_makecode:
addi $7, $0, 0x1E
addi $9, $0, 0x32
beq $6, $7, print
d3_makecode:
addi $7, $0, 0x26
addi $9, $0, 0x33
beq $6, $7, print
d4_makecode:
addi $7, $0, 0x25
addi $9, $0, 0x34
beq $6, $7, print
d5_makecode:
addi $7, $0, 0x2E
addi $9, $0, 0x35
beq $6, $7, print
d6_makecode:
addi $7, $0, 0x36
addi $9, $0, 0x36
beq $6, $7, print
d7_makecode:
addi $7, $0, 0x3D
addi $9, $0, 0x37
beq $6, $7, print
d8_makecode:
addi $7, $0, 0x3E
addi $9, $0, 0x38
beq $6, $7, print
d9_makecode:
addi $7, $0, 0x46
addi $9, $0, 0x39
beq $6, $7, print
space_makecode:
addi $7, $0, 0x29
addi $9, $0, 0x20
beq $6, $7, print
enter_makecode:
addi $7, $0, 0x5A
beq $6, $7, enter
j read_kbd1

lock:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, lock # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1

j lock
# print:

print:
jal display
j read_kbd1
display:
sw $9, 0($3) # to display
addi $3, $3, 1
jr $ra
enter:
addi $3, $3, 80
j read_kbd1