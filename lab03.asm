
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
#  strcmp code here!
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


