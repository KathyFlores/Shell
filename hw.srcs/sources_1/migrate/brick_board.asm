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
addi $s2, $zero, 0xfff # color white

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
addi $s2, $zero, 0xf77
sw $s2, 0($t3)
sw $s2, 1($t3)
sw $s2, 11($t3)
sw $s2, 12($t3)
addi $t3, $t3, 80
bne $t3, $t4, board_123

addi $t3, $s4, 240
addi $t4, $t3, 13
board_45:
addi $s2, $zero, 0xf77
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
addi $s2, $zero, 0xfff
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, erase_brick_1

addi $t3, $v0, 80
addi $v1, $t3, 3
erase_brick_2:
addi $s2, $zero, 0xfff
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, erase_brick_2

addi $t3, $v0, 160
addi $v1, $t3, 3
erase_brick_3:
addi $s2, $zero, 0xfff
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
addi $s2, $zero, 0xf00
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, brick_1

addi $t3, $v0, 160
addi $v1, $t3, 3
brick_2:
addi $s2, $zero, 0xf00
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, brick_2

addi $t3, $v0, 240
addi $v1, $t3, 3
brick_3:
addi $s2, $zero, 0xf00
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $v1, brick_3

clock2:
add $t4, $zero, $zero
addi $t3, $zero, 30000
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

next:
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
j next

left:
j clock3
clock3:
add $t4, $zero, $zero
addi $t3, $zero, 30000 
loop4:
addi $t4, $t4, 1 
bne $t4, $t3, loop4

addi $t3, $s4, 0
addi $t4, $s4, 240
erase_board_123_l:
addi $s2, $zero, 0xfff
sw $s2, 0($t3)
sw $s2, 1($t3)
sw $s2, 11($t3)
sw $s2, 12($t3)
addi $t3, $t3, 80
bne $t3, $t4, erase_board_123_l

addi $t3, $s4, 240
addi $t4, $t3, 13
erase_board_45_l:
addi $s2, $zero, 0xfff
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
addi $t3, $zero, 30000 
loop6:
addi $t4, $t4, 1 
bne $t4, $t3, loop6

addi $t3, $s4, 0
addi $t4, $s4, 240
erase_board_123_r:
addi $s2, $zero, 0xfff
sw $s2, 0($t3)
sw $s2, 1($t3)
sw $s2, 11($t3)
sw $s2, 12($t3)
addi $t3, $t3, 80
bne $t3, $t4, erase_board_123_r

addi $t3, $s4, 240
addi $t4, $t3, 13
erase_board_45_r:
addi $s2, $zero, 0xfff
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
addi $s2, $zero, 0xfff
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $s3, loop

addi $s2, $zero, 0x7ff
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

lw $t0, 0($a0) # state of switch
andi $t0, $t0, 1 # state of switch[0]
beq $t0, $zero, start_background # load back ground when switch[0] == 0

add $t3, $a1, $zero # initial t3
loop1: # clean vga
addi $s2, $zero, 0xfff
sw $s2, 0($t3)
addi $t3, $t3, 1
bne $t3, $s3, loop1
j game