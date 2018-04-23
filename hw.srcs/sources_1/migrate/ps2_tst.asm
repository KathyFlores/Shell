j initial
initial:
lui $s0, 0xffff
ori $s0, $s0, 0xd000
lui $s2, 0xe000
Input_char:
lw $s1, 0($s0)
andi $s3, $s1, 0x100
beq $s3, $zero, Input_char
andi $a1, $s1, 0xff

sw $a1, 0($s2)
j Input_char