main:
lui $3, 0x000c # vram space: 000c0000 - 000cffff
lui $4, 0xd000 # i/o space: d0000000 - dfffffff
addi $8, $0, 0xf0
read_kbd1:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, read_kbd1 # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
# $6:data
# $7:makecode
# make code:
A_makecode:
addi $7, $0, 0x1c
beq $6, $7, A_breakcode
B_makecode:
addi $7, $0, 0x32
beq $6, $7, B_breakcode
C_makecode:
addi $7, $0, 0x21
beq $6, $7, C_breakcode
D_makecode:
addi $7, $0, 0x23
beq $6, $7, D_breakcode
E_makecode:
addi $7, $0, 0x24
beq $6, $7, E_breakcode
F_makecode:
addi $7, $0, 0x2B
beq $6, $7, F_breakcode
G_makecode:
addi $7, $0, 0x34
beq $6, $7, G_breakcode
H_makecode:
addi $7, $0, 0x33
beq $6, $7, H_breakcode
I_makecode:
addi $7, $0, 0x43
beq $6, $7, I_breakcode
J_makecode:
addi $7, $0, 0x3B
beq $6, $7, J_breakcode
K_makecode:
addi $7, $0, 0x42
beq $6, $7, K_breakcode
L_makecode:
addi $7, $0, 0x4B
beq $6, $7, L_breakcode
M_makecode:
addi $7, $0, 0x3A
beq $6, $7, M_breakcode
N_makecode:
addi $7, $0, 0x31
beq $6, $7, N_breakcode
O_makecode:
addi $7, $0, 0x44
beq $6, $7, O_breakcode
P_makecode:
addi $7, $0, 0x4D
beq $6, $7, P_breakcode
Q_makecode:
addi $7, $0, 0x15
beq $6, $7, Q_breakcode
R_makecode:
addi $7, $0, 0x2D
beq $6, $7, R_breakcode
S_makecode:
addi $7, $0, 0x1B
beq $6, $7, S_breakcode
T_makecode:
addi $7, $0, 0x2C
beq $6, $7, T_breakcode
U_makecode:
addi $7, $0, 0x3C
beq $6, $7, U_breakcode
V_makecode:
addi $7, $0, 0x2A
beq $6, $7, V_breakcode
W_makecode:
addi $7, $0, 0x1D
beq $6, $7, W_breakcode
X_makecode:
addi $7, $0, 0x22
beq $6, $7, X_breakcode
Y_makecode:
addi $7, $0, 0x35
beq $6, $7, Y_breakcode
Z_makecode:
addi $7, $0, 0x1A
beq $6, $7, Z_breakcode
j read_kbd1
# breakcode:
A_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, A_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
A_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, A_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x1c
bne $6, $7, read_kbd1
printA:
addi $9, $0, 0x41
jal display
j read_kbd1

B_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, B_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
B_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, B_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x32
bne $6, $7, read_kbd1
printB:
addi $9, $0, 0x42
jal display
j read_kbd1

C_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, C_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
C_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, C_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x21
bne $6, $7, read_kbd1
printC:
addi $9, $0, 0x43
jal display
j read_kbd1

D_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, D_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
D_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, D_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x23
bne $6, $7, read_kbd1
printD:
addi $9, $0, 0x44
jal display
j read_kbd1

E_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, E_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
E_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, E_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x24
bne $6, $7, read_kbd1
printE:
addi $9, $0, 0x45
jal display
j read_kbd1

F_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, F_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
F_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, F_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x2B
bne $6, $7, read_kbd1
printF:
addi $9, $0, 0x46
jal display
j read_kbd1

G_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, G_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
G_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, G_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x34
bne $6, $7, read_kbd1
printG:
addi $9, $0, 0x47
jal display
j read_kbd1

H_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, H_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
H_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, H_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x33
bne $6, $7, read_kbd1
printH:
addi $9, $0, 0x48
jal display
j read_kbd1

I_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, I_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
I_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, I_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x43
bne $6, $7, read_kbd1
printI:
addi $9, $0, 0x49
jal display
j read_kbd1

J_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, J_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
J_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, J_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x3B
bne $6, $7, read_kbd1
printJ:
addi $9, $0, 0x4A
jal display
j read_kbd1

K_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, K_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
K_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, K_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x42
bne $6, $7, read_kbd1
printK:
addi $9, $0, 0x4B
jal display
j read_kbd1

L_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, L_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
L_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, L_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x4B
bne $6, $7, read_kbd1
printL:
addi $9, $0, 0x4C
jal display
j read_kbd1

M_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, M_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
M_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, M_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x3A
bne $6, $7, read_kbd1
printM:
addi $9, $0, 0x4D
jal display
j read_kbd1

N_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, N_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
N_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, N_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x31
bne $6, $7, read_kbd1
printN:
addi $9, $0, 0x4E
jal display
j read_kbd1

O_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, O_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
O_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, O_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x44
bne $6, $7, read_kbd1
printO:
addi $9, $0, 0x4F
jal display
j read_kbd1

P_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, P_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
P_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, P_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x4D
bne $6, $7, read_kbd1
printP:
addi $9, $0, 0x50
jal display
j read_kbd1

Q_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, Q_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
Q_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, Q_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x15
bne $6, $7, read_kbd1
printQ:
addi $9, $0, 0x51
jal display
j read_kbd1

R_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, R_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
R_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, R_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x2D
bne $6, $7, read_kbd1
printR:
addi $9, $0, 0x52
jal display
j read_kbd1

S_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, S_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
S_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, S_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x1B
bne $6, $7, read_kbd1
printS:
addi $9, $0, 0x53
jal display
j read_kbd1

T_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, T_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
T_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, T_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x2C
bne $6, $7, read_kbd1
printT:
addi $9, $0, 0x54
jal display
j read_kbd1

U_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, U_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
U_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, U_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x3C
bne $6, $7, read_kbd1
printU:
addi $9, $0, 0x55
jal display
j read_kbd1


V_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, V_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
V_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, V_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x2A
bne $6, $7, read_kbd1
printV:
addi $9, $0, 0x56
jal display
j read_kbd1

W_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, W_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
W_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, W_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x1D
bne $6, $7, read_kbd1
printW:
addi $9, $0, 0x57
jal display
j read_kbd1

X_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, X_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
X_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, X_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x22
bne $6, $7, read_kbd1
printX:
addi $9, $0, 0x58
jal display
j read_kbd1

Y_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, Y_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
Y_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, Y_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x35
bne $6, $7, read_kbd1
printY:
addi $9, $0, 0x59
jal display
j read_kbd1

Z_breakcode:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, Z_breakcode # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
bne $6, $8, read_kbd1 # 8:f0
Z_next:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, Z_next # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x1A
bne $6, $7, read_kbd1
printZ:
addi $9, $0, 0x5A
jal display
j read_kbd1

display:
sw $9, 0($3) # to display
addi $3, $3, 1
jr $ra
