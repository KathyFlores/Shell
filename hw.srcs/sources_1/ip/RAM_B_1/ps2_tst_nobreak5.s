main:
lui $3, 0x000c # vram space: 000c0000 - 000cffff
lui $4, 0xd000 # i/o space: d0000000 - dfffffff
ori $2, $3, 4800 # endaddress of vram
addi $8, $0, 0xf0
add $10, $0, $0
add $11, $0, $0
read_kbd1:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, read_kbd1 # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
# $6:input data
# $7:makecode
# $8:f0
# $9:ascii
# $10:capslock,=1:daxie
# $11:shift, =1:pressed
# make code:
beq $6, $8, lock #F0, lock
CapsLock_makecode:
addi $7, $0, 0x58
bne $6, $7, leftshift
xori $10, $10, 0x1
j read_kbd1
leftshift:
addi $7, $0, 0x12
bne $6, $7, rightshift
addi $11, $0, 0x1
j read_kbd1
rightshift:
addi $7, $0, 0x59
bne $6, $7, A_makecode
addi $11, $0, 0x1
j read_kbd1
A_makecode:
addi $7, $0, 0x1c
beq $10, $0, A_xx #a
addi $9, $0, 0x41
beq $6, $7, print
A_xx:
addi $9, $0, 0x61
beq $6, $7, print

B_makecode:
addi $7, $0, 0x32
beq $10, $0, B_xx
addi $9, $0, 0x42
beq $6, $7, print
B_xx:
addi $9, $0, 0x62
beq $6, $7, print

C_makecode:
addi $7, $0, 0x21
beq $10, $0, C_xx
addi $9, $0, 0x43
beq $6, $7, print
C_xx:
addi $9, $0, 0x63
beq $6, $7, print

D_makecode:
addi $7, $0, 0x23
beq $10, $0, D_xx
addi $9, $0, 0x44
beq $6, $7, print
D_xx:
addi $9, $0, 0x64
beq $6, $7, print

E_makecode:
addi $7, $0, 0x24
beq $10, $0, E_xx
addi $9, $0, 0x45
beq $6, $7, print
E_xx:
addi $9, $0, 0x65
beq $6, $7, print

F_makecode:
addi $7, $0, 0x2B
beq $10, $0, F_xx
addi $9, $0, 0x46
beq $6, $7, print
F_xx:
addi $9, $0, 0x66
beq $6, $7, print

G_makecode:
addi $7, $0, 0x34
beq $10, $0, G_xx
addi $9, $0, 0x47
beq $6, $7, print
G_xx:
addi $9, $0, 0x67
beq $6, $7, print

H_makecode:
addi $7, $0, 0x33
beq $10, $0, H_xx
addi $9, $0, 0x48
beq $6, $7, print
H_xx:
addi $9, $0, 0x68
beq $6, $7, print

I_makecode:
addi $7, $0, 0x43
beq $10, $0, I_xx
addi $9, $0, 0x49
beq $6, $7, print
I_xx:
addi $9, $0, 0x69
beq $6, $7, print

J_makecode:
addi $7, $0, 0x3B
beq $10, $0, J_xx
addi $9, $0, 0x4A
beq $6, $7, print
J_xx:
addi $9, $0, 0x6A
beq $6, $7, print

K_makecode:
addi $7, $0, 0x42
beq $10, $0, K_xx
addi $9, $0, 0x4B
beq $6, $7, print
K_xx:
addi $9, $0, 0x6B
beq $6, $7, print

L_makecode:
addi $7, $0, 0x4B
beq $10, $0, L_xx
addi $9, $0, 0x4C
beq $6, $7, print
L_xx:
addi $9, $0, 0x6C
beq $6, $7, print

M_makecode:
addi $7, $0, 0x3A
beq $10, $0, M_xx
addi $9, $0, 0x4D
beq $6, $7, print
M_xx:
addi $9, $0, 0x6D
beq $6, $7, print

N_makecode:
addi $7, $0, 0x31
beq $10, $0, N_xx
addi $9, $0, 0x4E
beq $6, $7, print
N_xx:
addi $9, $0, 0x6E
beq $6, $7, print

O_makecode:
addi $7, $0, 0x44
beq $10, $0, O_xx
addi $9, $0, 0x4F
beq $6, $7, print
O_xx:
addi $9, $0, 0x6F
beq $6, $7, print

P_makecode:
addi $7, $0, 0x4D
beq $10, $0, P_xx
addi $9, $0, 0x50
beq $6, $7, print
P_xx:
addi $9, $0, 0x70
beq $6, $7, print

Q_makecode:
addi $7, $0, 0x15
beq $10, $0, Q_xx
addi $9, $0, 0x51
beq $6, $7, print
Q_xx:
addi $9, $0, 0x71
beq $6, $7, print

R_makecode:
addi $7, $0, 0x2D
beq $10, $0, R_xx
addi $9, $0, 0x52
beq $6, $7, print
R_xx:
addi $9, $0, 0x72
beq $6, $7, print

S_makecode:
addi $7, $0, 0x1B
beq $10, $0, S_xx
addi $9, $0, 0x53
beq $6, $7, print
S_xx:
addi $9, $0, 0x73
beq $6, $7, print

T_makecode:
addi $7, $0, 0x2C
beq $10, $0, T_xx
addi $9, $0, 0x54
beq $6, $7, print
T_xx:
addi $9, $0, 0x74
beq $6, $7, print

U_makecode:
addi $7, $0, 0x3C
beq $10, $0, U_xx
addi $9, $0, 0x55
beq $6, $7, print
U_xx:
addi $9, $0, 0x75
beq $6, $7, print

V_makecode:
addi $7, $0, 0x2A
beq $10, $0, V_xx
addi $9, $0, 0x56
beq $6, $7, print
V_xx:
addi $9, $0, 0x76
beq $6, $7, print

W_makecode:
addi $7, $0, 0x1D
beq $10, $0, W_xx
addi $9, $0, 0x57
beq $6, $7, print
W_xx:
addi $9, $0, 0x77
beq $6, $7, print

X_makecode:
addi $7, $0, 0x22
beq $10, $0, X_xx
addi $9, $0, 0x58
beq $6, $7, print
X_xx:
addi $9, $0, 0x78
beq $6, $7, print

Y_makecode:
addi $7, $0, 0x35
beq $10, $0, Y_xx
addi $9, $0, 0x59
beq $6, $7, print
Y_xx:
addi $9, $0, 0x79
beq $6, $7, print

Z_makecode:
addi $7, $0, 0x1A
beq $10, $0, Z_xx
addi $9, $0, 0x5A
beq $6, $7, print
Z_xx:
addi $9, $0, 0x7A
beq $6, $7, print

d0_makecode:
addi $7, $0, 0x45
bne $11, $0, upper30
addi $9, $0, 0x30
beq $6, $7, print
upper30:
addi $9, $0, 0x29
beq $6, $7, print
d1_makecode:
addi $7, $0, 0x16
bne $11, $0, upper31
addi $9, $0, 0x31
beq $6, $7, print
upper31:
addi $9, $0, 0x21
beq $6, $7, print
d2_makecode:
addi $7, $0, 0x1E
bne $11, $0, upper32
addi $9, $0, 0x32
beq $6, $7, print
upper32:
addi $9, $0, 0x40
beq $6, $7, print
d3_makecode:
addi $7, $0, 0x26
bne $11, $0, upper33
addi $9, $0, 0x33
beq $6, $7, print
upper33:
addi $9, $0, 0x23
beq $6, $7, print
d4_makecode:
addi $7, $0, 0x25
bne $11, $0, upper34
addi $9, $0, 0x34
beq $6, $7, print
upper34:
addi $9, $0, 0x24
beq $6, $7, print
d5_makecode:
addi $7, $0, 0x2E
bne $11, $0, upper35
addi $9, $0, 0x35
beq $6, $7, print
upper35:
addi $9, $0, 0x25
beq $6, $7, print
d6_makecode:
addi $7, $0, 0x36
bne $11, $0, upper36
addi $9, $0, 0x36
beq $6, $7, print
upper36:
addi $9, $0, 0x5E
beq $6, $7, print
d7_makecode:
addi $7, $0, 0x3D
bne $11, $0, upper37
addi $9, $0, 0x37
beq $6, $7, print
upper37:
addi $9, $0, 0x26
beq $6, $7, print
d8_makecode:
addi $7, $0, 0x3E
bne $11, $0, upper38
addi $9, $0, 0x38
beq $6, $7, print
upper38:
addi $9, $0, 0x2A
beq $6, $7, print
d9_makecode:
addi $7, $0, 0x46
bne $11, $0, upper39
addi $9, $0, 0x39
beq $6, $7, print
upper39:
addi $9, $0, 0x28
beq $6, $7, print
#-:
addi $7, $0, 0x4E
bne $11, $0, upper2d # shift pressed
addi $9, $0, 0x2D
beq $6, $7, print
upper2d:
addi $9, $0, 0x5F
beq $6, $7, print
#=:
addi $7, $0, 0x55
bne $11, $0, upper3d
addi $9, $0, 0x3D
beq $6, $7, print
upper3d:
addi $9, $0, 0x2B
beq $6, $7, print
#[:
addi $7, $0, 0x54
bne $11, $0, upper5b
addi $9, $0, 0x5B
beq $6, $7, print
upper5b:
addi $9, $0, 0x7B
beq $6, $7, print
#]:
addi $7, $0, 0x5B
bne $11, $0, upper5d
addi $9, $0, 0x5d
beq $6, $7, print
upper5d:
addi $9, $0, 0x7d
beq $6, $7, print
#\:
addi $7, $0, 0x5D
bne $11, $0, upper5c
addi $9, $0, 0x5c
beq $6, $7, print
upper5c:
addi $9, $0, 0x7c
beq $6, $7, print
#`:
addi $7, $0, 0x0E
bne $11, $0, upper60
addi $9, $0, 0x60
beq $6, $7, print
upper60:
addi $9, $0, 0x7e
beq $6, $7, print
#;:
addi $7, $0, 0x4C
bne $11, $0, upper3b
addi $9, $0, 0x3B
beq $6, $7, print
upper3b:
addi $9, $0, 0x3a
beq $6, $7, print
#':
addi $7, $0, 0x52
bne $11, $0, upper27
addi $9, $0, 0x27
beq $6, $7, print
upper27:
addi $9, $0, 0x22
beq $6, $7, print
#,:
addi $7, $0, 0x41
bne $11, $0, upper2c
addi $9, $0, 0x2c
beq $6, $7, print
upper2c:
addi $9, $0, 0x3c
beq $6, $7, print
#.:
addi $7, $0, 0x49
bne $11, $0, upper2e
addi $9, $0, 0x2e
beq $6, $7, print
upper2e:
addi $9, $0, 0x3e
beq $6, $7, print
#/:
addi $7, $0, 0x4A
bne $11, $0, upper2f
addi $9, $0, 0x2f
beq $6, $7, print
upper2f:
addi $9, $0, 0x3f
beq $6, $7, print
space_makecode:
addi $7, $0, 0x29
addi $9, $0, 0x20
beq $6, $7, print
enter_makecode:
addi $7, $0, 0x5A
beq $6, $7, enter
backspace_makecode:
addi $7, $0, 0x66
addi $9, $0, 0x19
beq $6, $7, backspace

arrowkey_makecode:
addi $7, $0, 0xe0
beq $6, $7, arrowkey
j read_kbd1

lock:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, lock # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
addi $7, $0, 0x12 # leftshift
beq $6, $7, shift_unpressed
addi $7, $0, 0x59 # rightshift
beq $6, $7, shift_unpressed
bne $6, $8, read_kbd1

j lock
arrowkey:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, arrowkey # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
beq $6, $8, lock #F0, lock
left_arrow:
addi $7, $0, 0x6b
bne $6, $7, up_arrow
addi $3, $3, -1
j read_kbd1
up_arrow:
addi $7, $0, 0x75
bne $6, $7, right_arrow
addi $3, $3, -80
j read_kbd1
right_arrow:
addi $7, $0, 0x74
bne $6, $7, down_arrow
addi $3, $3, 1
j read_kbd1
down_arrow:
addi $7, $0, 0x72
bne $6, $7, read_kbd1
addi $3, $3, 80
j read_kbd1
shift_unpressed:
add $11, $0, $0
j read_kbd1
print:
jal display
j read_kbd1
backspace:
addi $3, $3, -1
sw $9, 0($3)
j read_kbd1
display:
lui $14, 0x000c
addi $14, $14, -1
slt $12, $3, $2 # $12=1:current < 4800
slt $13, $14, $3 # $14=1:current >= 0
and $12, $12, $13 # $12=1:on display
bne $12, $0, next
lui $3, 0x000c
next:
sw $9, 0($3) # to display
addi $3, $3, 1
jr $ra
enter: #$12, $13, $14:temp reg
add $12, $0, $3
andi $12, $12, 0xffff
lui $3, 0x000c
add $13, $3, $0
divider:
addi $12, $12, -79
addi $13, $13, 80
slt $14, $0, $12
bne $14, $0, divider
lui $3, 0x000c
or $3, $3, $13
j read_kbd1
