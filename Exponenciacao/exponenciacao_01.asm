.data
.text
.globl main

main:

	li $a1, 2 # int b = 2
	li $a2, 3 # int e = 3
	
	jal power
	
	move $t1, $v0 # t1 recebe o returno da funcao power
	
	li $v0, 1
	move $a0, $t1 # printa o resultado
	syscall
	
	li $v0, 10 # encerra o programa
	syscall
	
.globl power

power:
	li $t0, 0 # int i = 0
	li $v0, 1 # int res = 1
	
	for:
	beq $t0, $a2, exit_power # sai da funcao se i == e
	
	mul $v0, $v0, $a1 # res *= b
	addi $t0, $t0, 1 # i++
	
	j for 
	
	exit_power:
	jr $ra
	
	