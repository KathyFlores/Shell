main:
lui $3, 0x000c # vram space: 000c0000 - 000cffff
lui $4, 0xd000 # i/o space: d0000000 - dfffffff

read_kbd:
lw $5, 0($4) # read kbd: {0,ready,byte}
andi $6, $5, 0x100 # check if ready
beq $6, $0, read_kbd # if no key pressed, wait
andi $6, $5, 0xff # ready, get data
srl $5, $6, 4 # first digit
addi $7, $5, -10
srl $7, $7, 31
beq $7, $0, abcdef1
addi $5, $5, 0x30 # to ascii [0-9]
j print1
abcdef1:
addi $5, $5, 0x37 # to ascii [a-f]
print1:
jal display # display char
andi $5, $6, 0xf # second digit
addi $7, $5, -10
srl $7, $7, 31
beq $7, $0, abcdef2
addi $5, $5, 0x30 # to ascii [0-9]
j print2
abcdef2:
addi $5, $5, 0x37 # to ascii [a-f]
print2:
jal display # display char
addi $5, $0, 0x20 # [Space]
print3:
jal display # display char
j read_kbd # check next
display:
sw $5, 0($3) # to display
addi $3, $3, 1
jr $ra
