Initial:
lui $a1, 0x000c;
ori $a2, $a1, 4800;
ori $t4, $a1, 2400;
addi $s1, $zero, 0x41; #A
addi $s2, $zero, 0x42;

main:
add $t5, $s1, $zero;
#swap:
clock:
add $t6, $zero, $zero
addi $t3, $zero, 0x7fff
loop3:
addi $t6, $t6, 1 
bne $t6, $t3, loop3

add $s1, $s2, $zero; 
add $s2, $t5, $zero;
add $t1, $a1, $zero;

loop:
sw $s1, 0($t1);
addi $t1, $t1, 1;
beq $t1, $t4, loop2;
j loop;
loop2:
sw $s2, 0($t1);
addi $t1, $t1, 1;
beq $t1, $a2, main;
j loop2;