.data
.text
.globl main

main:

	li $a1, 3 # int exp = 3
	
	jal power_base2
	
	move $t1, $v0 # t1 recebe o returno da funcao power
	
	li $v0, 1
	move $a0, $t1 # printa o resultado
	syscall
	
	li $v0, 10 # encerra o programa
	syscall
	
.globl power_base2

power_base2:
	li $v0, 2
	sllv $v0, $v0, $a1 # v0 = 2 << exp
	jr $ra # return v0
	
	