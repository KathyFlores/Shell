# $1:begin address of vram
# $2:end address of vram
# $3:current address
# $4:keyboard address
# $5:read data from keyboard 
# $6:keyboard input data
# $7:makecode
# $8:f0
# $9:ascii
# $10:capslock,=1:daxie
# $11:shift, =1:pressed
# $28:loadstring, =1:load
# $27:address of cursor
main:
lui $1, 0x000c # vram space: 000c0000 - 000cffff
lui $4, 0xd000 # i/o space: d0000000 - dfffffff
add $3, $1, $0 # current addr initial
ori $2, $3, 4800 # end address of vram
addi $8, $0, 0xf0 
add $10, $0, $0 #capslock initial
add $11, $0, $0 #shift initial
lui $27, 0xf000 #cursor addr
add $28, $0, $0 #load string initial
prompt:
addi $9, $0, 0x3E
jal print_command
addi $9, $0, 0x3E
jal print_command
addi $9, $0, 0x3E
jal print_command
j read_kbd1
print_command:
add $14, $0, $1
addi $14, $14, -1
slt $12, $3, $2 # $12=1:current < 4800
slt $13, $14, $3 # $14=1:current >= 0
and $12, $12, $13 # $12=1:on display
bne $12, $0, next_c
add $3, $0, $1
next_c:
sw $9, 0($3) # to display
addi $3, $3, 1
andi $12, $3, 0x3fff
sw $12, 0($27)
jr $ra

read_kbd1:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, read_kbd1 # if no key pressed, wait
andi $6, $5, 0xff # ready, get data

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
addi $9, $0, 0x0D
addi $28, $0, 1
beq $6, $7, enter
backspace_makecode:
addi $7, $0, 0x66
addi $9, $0, 0x10
beq $6, $7, backspace

e0_makecode:
addi $7, $0, 0xe0
beq $6, $7, e0key
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
e0key:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, e0key # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
beq $6, $8, lock #F0, lock
# delete:
# addi $7, $0, 0x71
# bne $6, $7, left_arrow
# addi $12, $3, 1
# add $14, $3, $0
# lw $13, 0($12)
# sw $13, 0($14)
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

lw $12, 0($3)
addi $13, $0, 0x3E
bne $12, $13, backspace_next
addi $3, $3, 1

j read_kbd1
backspace_next:
sw $9, 1($3)

addi $9, $0, 0x5F
andi $15, $3, 0x3fff
sw $15, 0($27)
sw $9, 0($3)
j read_kbd1
display:
add $14, $0, $1
addi $14, $14, -1
slt $12, $3, $2 # $12=1:current < 4800
slt $13, $14, $3 # $14=1:current >= 0
and $12, $12, $13 # $12=1:on display
bne $12, $0, next
add $3, $0, $1

next:
sw $9, 0($3) # to display

addi $15, $0, 0x5F
sw $15, 1($3)

addi $3, $3, 1

andi $12, $3, 0x3fff
sw $12, 0($27)
jr $ra
enter: #$12, $13, $14:temp reg
sw $9, 0($3)

add $12, $0, $3
andi $12, $12, 0xffff
add $3, $0, $1
add $13, $3, $0
divider:
addi $12, $12, -79
addi $13, $13, 80
slt $14, $0, $12
bne $14, $0, divider
add $3, $0, $1
or $3, $3, $13

addi $9, $0, 0x3E
jal print_command
addi $9, $0, 0x3E
jal print_command
addi $9, $0, 0x3E
jal print_command

addi $14, $3, -3
bne $28, $0, load_string_pre
j read_kbd1
#27:=1:game
#26:=1:hello
load_string_pre:
add $28, $0, $0
addi $14, $14, -80
lw $12, -83($3)
sw $12, 0($3)
addi $13, $0, 0x3E
bne $12, $13, load_string_pre
lw $12, -82($3)
sw $12, 1($3)
bne $12, $13, load_string_pre
lw $12, -81($3)
sw $12, 2($3)
bne $12, $13, load_string_pre

game0:
lw $12, 3($14)
addi $13, $0, 0x67 #g
beq $12, $13, game1
hello0:
lw $12, 3($14)
addi $13, $0, 0x68 #h
beq $12, $13, hello1
j read_kbd1

game1:
lw $12, 4($14)
addi $13, $0, 0x61 #a
beq $12, $13, game2
hello1:
lw $12, 4($14)
addi $13, $0, 0x65 #e
beq $12, $13, hello2
j read_kbd1

game2:
lw $12, 5($14)
addi $13, $0, 0x6d #m
beq $12, $13, game3
hello2:
lw $12, 5($14)
addi $13, $0, 0x6C #l
beq $12, $13, hello3
j read_kbd1

game3:
lw $12, 6($14)
addi $13, $0, 0x65 #e
beq $12, $13, game4
hello3:
lw $12, 6($14)
addi $13, $0, 0x6C #l
beq $12, $13, hello4
j read_kbd1

game4:
lw $12, 7($14)
addi $13, $0, 0x0d #\n
beq $12, $13, game_
hello4:
lw $12, 7($14)
addi $13, $0, 0x6f #o
beq $12, $13, hello5
j read_kbd1

hello5:
lw $12, 8($14)
addi $13, $0, 0x0d #\n
beq $12, $13, hello
j read_kbd1

hello:
addi $9, $0, 0x68 #h
jal display
addi $9, $0, 0x65 #e
jal display
addi $9, $0, 0x6c #l
jal display
addi $9, $0, 0x6c #l
jal display
addi $9, $0, 0x6f #o
jal display
addi $9, $0, 0x20 # 
jal display
addi $9, $0, 0x77 #w
jal display
addi $9, $0, 0x6f #o
jal display
addi $9, $0, 0x72 #r
jal display
addi $9, $0, 0x6c #l
jal display
addi $9, $0, 0x64 #d
jal display
addi $9, $0, 0x0D #new line
jal display
j enter

game_:
j initial
initial:
lui $a0, 0xf000 # address of switch and btn
lui $a1, 0x000c # begin addr of vram
ori $s3, $a1, 4800 # end addr of vram
lui $s5, 0xe000 # address of 7 seg
add $t9, $zero, $zero # random number
add $at, $zero, $zero # score
sw $at, 0($s5)
ori $v0, $a1, 20  # start addr of brick, 1st row
# addi $v1, $v0, 3 # end addr of the brick, 1st row
ori $a2, $a1, 4740 # bottom bound of brick
ori $s4, $a1, 4424 # start addr of board

addi $s0, $zero, 0x100 # button left
addi $s1, $zero, 0x400 # button right
addi $s2, $zero, 0x0 # color white

game:
lw $t0, 0($a0) # state of switch
andi $t0, $t0, 1 # state of switch[0]
beq $t0, $zero, start_background # load back ground when switch[0] == 0

board:
addi $t3, $s4, 0
addi $t4, $s4, 240
addi $s6, $s4, 400
# addi $v1, $t3, 3
board_123:
addi $s2, $zero, 0x7f
sw $s2, 0($t3)
sw $s2, 1($t3)
sw $s2, 11($t3)
sw $s2, 12($t3)
addi $t3, $t3, 80
bne $t3, $t4, board_123

addi $t3, $s4, 240
addi $t4, $t3, 13
board_45:
addi $s2, $zero, 0x7f
sw $s2, 0($t3)
sw $s2, 80($t3)
addi $t3, $t3, 1
bne $t3, $t4, board_45

lw $t2, 0($a0) # data from btn
andi $t2, $t2, 0xf00 #data from btn
beq $t2, $s0, left # go left
beq $t2, $s1, right # go right

add $t3, $v0, $zero # initial t3
addi $v1, $t3, 3 # initial v1
erase_brick_1:
addi $s2, $zero, 0x0
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, erase_brick_1

addi $t3, $v0, 80
addi $v1, $t3, 3
erase_brick_2:
addi $s2, $zero, 0x0
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, erase_brick_2

addi $t3, $v0, 160
addi $v1, $t3, 3
erase_brick_3:
addi $s2, $zero, 0x0
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, erase_brick_3

clock1:
add $t4, $zero, $zero
addi $t3, $zero, 500 
loop2:
addi $t4, $t4, 1 
bne $t4, $t3, loop2

addi $t3, $v0, 80
addi $v1, $t3, 3
brick_1:
addi $s2, $zero, 0x7f
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, brick_1

addi $t3, $v0, 160
addi $v1, $t3, 3
brick_2:
addi $s2, $zero, 0x7f
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, brick_2

addi $t3, $v0, 240
addi $v1, $t3, 3
brick_3:
addi $s2, $zero, 0x7f
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, brick_3

clock2:
add $t4, $zero, $zero
lui $t3, 0x0001
loop3:
addi $t4, $t4, 1 
bne $t4, $t3, loop3

drop_down:
addi $v0, $v0, 80
slt $t3, $v0, $s3
bne $t3, $zero, game

return_top:
addi $t8, $v0, -400
# if t8 >= s4 && t8 < s4+11, score+1
addi $t7, $s4, -1
slt $t3, $t7, $t8 # t3=1 if s4-1<t8(t8>=s4)
# beq $t3, $zero, plus_score
addi $t7, $s4, 11
slt $t4, $t8, $t7 # t4=1 if t8<s4+11
and $t4, $t4, $t3
bne $t4, $zero, plus_score

next2:
addi $t9, $t9, 25
addi $v0, $v0, -4800
add $v0, $v0, $t9

random:
ori $t4, $a1, 76
slt $t3, $v0, $t4
bne $t3, $zero, game
andi $v0, $v0, 0x3f
or $v0, $v0, $a1
j random

plus_score:
addi $at, $at, 1
sw $at, 0($s5)
j next2

left:
j clock3
clock3:
add $t4, $zero, $zero
lui $t3, 0x0001
loop4:
addi $t4, $t4, 1 
bne $t4, $t3, loop4

addi $t3, $s4, 0
addi $t4, $s4, 240
erase_board_123_l:
addi $s2, $zero, 0x0
sw $s2, 0($t3)
sw $s2, 1($t3)
sw $s2, 11($t3)
sw $s2, 12($t3)
addi $t3, $t3, 80
bne $t3, $t4, erase_board_123_l

addi $t3, $s4, 240
addi $t4, $t3, 13
erase_board_45_l:
addi $s2, $zero, 0x0
sw $s2, 0($t3)
sw $s2, 80($t3)
addi $t3, $t3, 1
bne $t3, $t4, erase_board_45_l

clock4:
add $t4, $zero, $zero
addi $t3, $zero, 500 
loop5:
addi $t4, $t4, 1 
bne $t4, $t3, loop5

go_left:
# addi $t3, $zero, 1
addi $s4, $s4, -1
ori $t3, $a1, 4400
# slt $t4, $s4, $t3
bne $s4, $t3, game
ori $s4, $a1, 4467
j game

right:
j clock5
clock5:
add $t4, $zero, $zero
lui $t3, 0x0001
loop6:
addi $t4, $t4, 1 
bne $t4, $t3, loop6

addi $t3, $s4, 0
addi $t4, $s4, 240
erase_board_123_r:
addi $s2, $zero, 0x0
sw $s2, 0($t3)
sw $s2, 1($t3)
sw $s2, 11($t3)
sw $s2, 12($t3)
addi $t3, $t3, 80
bne $t3, $t4, erase_board_123_r

addi $t3, $s4, 240
addi $t4, $t3, 13
erase_board_45_r:
addi $s2, $zero, 0x0
sw $s2, 0($t3)
sw $s2, 80($t3)
addi $t3, $t3, 1
bne $t3, $t4, erase_board_45_r

clock6:
add $t4, $zero, $zero
addi $t3, $zero, 500 
loop7:
addi $t4, $t4, 1 
bne $t4, $t3, loop7

go_right:
addi $s4, $s4, 1
addi $t3, $a1, 4468
# slt $t4, $s4, $t3
bne $s4, $t3, game
addi $s4, $a1, 4400
j game

start_background:
add $t3, $zero, $a1
loop:
addi $s2, $zero, 0x0
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $s3, loop

addi $s2, $zero, 0x7f
sw $s2, 1933($a1)
sw $s2, 1934($a1)
sw $s2, 1935($a1)
sw $s2, 1936($a1)
sw $s2, 1937($a1)
sw $s2, 1938($a1)
sw $s2, 1944($a1)
sw $s2, 1945($a1)
sw $s2, 1946($a1)
sw $s2, 1947($a1)
sw $s2, 1948($a1)
sw $s2, 1949($a1)
sw $s2, 1950($a1)
sw $s2, 1951($a1)
sw $s2, 1959($a1)
sw $s2, 1960($a1)
sw $s2, 1968($a1)
sw $s2, 1969($a1)
sw $s2, 1970($a1)
sw $s2, 1971($a1)
sw $s2, 1972($a1)
sw $s2, 1973($a1)
sw $s2, 1974($a1)
sw $s2, 1980($a1)
sw $s2, 1981($a1)
sw $s2, 1982($a1)
sw $s2, 1983($a1)
sw $s2, 1984($a1)
sw $s2, 1985($a1)
sw $s2, 1986($a1)
sw $s2, 1987($a1)
sw $s2, 2012($a1)
sw $s2, 2019($a1)
sw $s2, 2027($a1)
sw $s2, 2028($a1)
sw $s2, 2039($a1)
sw $s2, 2040($a1)
sw $s2, 2048($a1)
sw $s2, 2055($a1)
sw $s2, 2063($a1)
sw $s2, 2064($a1)
sw $s2, 2092($a1)
sw $s2, 2099($a1)
sw $s2, 2107($a1)
sw $s2, 2108($a1)
sw $s2, 2118($a1)
sw $s2, 2121($a1)
sw $s2, 2128($a1)
sw $s2, 2135($a1)
sw $s2, 2143($a1)
sw $s2, 2144($a1)
sw $s2, 2172($a1)
sw $s2, 2187($a1)
sw $s2, 2188($a1)
sw $s2, 2198($a1)
sw $s2, 2201($a1)
sw $s2, 2208($a1)
sw $s2, 2215($a1)
sw $s2, 2223($a1)
sw $s2, 2224($a1)
sw $s2, 2252($a1)
sw $s2, 2267($a1)
sw $s2, 2268($a1)
sw $s2, 2278($a1)
sw $s2, 2281($a1)
sw $s2, 2288($a1)
sw $s2, 2289($a1)
sw $s2, 2290($a1)
sw $s2, 2291($a1)
sw $s2, 2292($a1)
sw $s2, 2293($a1)
sw $s2, 2294($a1)
sw $s2, 2303($a1)
sw $s2, 2304($a1)
sw $s2, 2333($a1)
sw $s2, 2334($a1)
sw $s2, 2335($a1)
sw $s2, 2336($a1)
sw $s2, 2337($a1)
sw $s2, 2338($a1)
sw $s2, 2347($a1)
sw $s2, 2348($a1)
sw $s2, 2357($a1)
sw $s2, 2358($a1)
sw $s2, 2359($a1)
sw $s2, 2360($a1)
sw $s2, 2361($a1)
sw $s2, 2362($a1)
sw $s2, 2368($a1)
sw $s2, 2369($a1)
sw $s2, 2370($a1)
sw $s2, 2383($a1)
sw $s2, 2384($a1)
sw $s2, 2419($a1)
sw $s2, 2427($a1)
sw $s2, 2428($a1)
sw $s2, 2437($a1)
sw $s2, 2442($a1)
sw $s2, 2448($a1)
sw $s2, 2450($a1)
sw $s2, 2451($a1)
sw $s2, 2463($a1)
sw $s2, 2464($a1)
sw $s2, 2442($a1)
sw $s2, 2499($a1)
sw $s2, 2507($a1)
sw $s2, 2508($a1)
sw $s2, 2517($a1)
sw $s2, 2522($a1)
sw $s2, 2528($a1)
sw $s2, 2531($a1)
sw $s2, 2532($a1)
sw $s2, 2543($a1)
sw $s2, 2544($a1)
sw $s2, 2572($a1)
sw $s2, 2579($a1)
sw $s2, 2587($a1)
sw $s2, 2588($a1)
sw $s2, 2596($a1)
sw $s2, 2597($a1)
sw $s2, 2602($a1)
sw $s2, 2603($a1)
sw $s2, 2608($a1)
sw $s2, 2612($a1)
sw $s2, 2613($a1)
sw $s2, 2623($a1)
sw $s2, 2624($a1)
sw $s2, 2652($a1)
sw $s2, 2659($a1)
sw $s2, 2667($a1)
sw $s2, 2668($a1)
sw $s2, 2676($a1)
sw $s2, 2683($a1)
sw $s2, 2688($a1)
sw $s2, 2693($a1)
sw $s2, 2694($a1)
sw $s2, 2703($a1)
sw $s2, 2704($a1)
sw $s2, 2733($a1)
sw $s2, 2734($a1)
sw $s2, 2735($a1)
sw $s2, 2736($a1)
sw $s2, 2737($a1)
sw $s2, 2738($a1)
sw $s2, 2747($a1)
sw $s2, 2748($a1)
sw $s2, 2737($a1)
sw $s2, 2756($a1)
sw $s2, 2763($a1)
sw $s2, 2768($a1)
sw $s2, 2774($a1)
sw $s2, 2775($a1)
sw $s2, 2783($a1)
sw $s2, 2784($a1)
clock7:
add $t4, $zero, $zero
lui $t3, 0x0001
loop8:
addi $t4, $t4, 1 
bne $t4, $t3, loop8
lw $t0, 0($a0) # state of switch
andi $t0, $t0, 1 # state of switch[0]
beq $t0, $zero, start_background # load back ground when switch[0] == 0

add $t3, $a1, $zero # initial t3
loop1: # clean vga
addi $s2, $zero, 0x0
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $s3, loop1
j game
