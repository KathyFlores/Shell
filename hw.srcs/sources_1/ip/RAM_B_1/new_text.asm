Initial:
lui $a1, 0x000c;
ori $a2, $a1, 4800;
ori $t4, $a1, 1388;
addi $s1, $zero, 0x41; #A


main:
sw $s1, 0($t4)
#swap:
clock:
add $t6, $zero, $zero
lui $t3, 0x0100
loop3:
addi $t6, $t6, 1 
bne $t6, $t3, loop3

j main