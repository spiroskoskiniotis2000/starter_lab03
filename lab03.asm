
# DO NOT DELCARE main IN THE .globl DIRECTIVE. BREAKS MUNIT!
          .globl strcmp, rec_b_search

          .data

aadvark:  .asciiz "aadvark"
ant:      .asciiz "ant"
elephant: .asciiz "elephant"
gorilla:  .asciiz "gorilla"
hippo:    .asciiz "hippo"
empty:    .asciiz ""

          # make sure the array elements are correctly aligned
          .align 2
sarray:   .word aadvark, ant, elephant, gorilla, hippo
endArray: .word 0  # dummy

.text

main:
            la   $a0, empty
            addi $a1, $a0,   0 # 16
            jal  strcmp

            la   $a0, sarray
            la   $a1, endArray
			addi $a1, $a1,     -4  # point to the last element of sarray
            la   $a2, hippo
            jal  rec_b_search

            addiu      $v0, $zero, 10    # system service 10 is exit
            syscall                      # we are outa here.
 

# a0 - address of string 1
# a1 - address of string 2
strcmp:
######################################################

loop:
	add	$s0,$zero,$a0
	add	$s1,$zero,$a1
	lb	$t0,0($s0)
	lb	$t1,0($s1)
	beq	$t0,$t1,equal
	slt	$t2,$t0,$t1
	bne	$t2,zero,less
	beq	$t2,$zero,greater

less:	
	addi	$v0,$zero,-1
	j	exit
	

greater:
	addi	$v0,$zero,1
	j	exit
	

equal:
	add  	$v0,$zero,$zero
	beq	$t0,$zero,exit
	addi	$s0,$so,1
	addi	$s1,$s1,1
	j	loop
	

exit:
######################################################
            jr   $ra


# a0 - base address of array
# a1 - address of last element of array
# a2 - pointer to string to try to match
rec_b_search:
######################################################
#  rec_b_search code here!
######################################################
            jr   $ra


