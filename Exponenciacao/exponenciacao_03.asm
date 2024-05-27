.data
	entrada_x: .asciiz "Digite o  x: "
	entrada_exp: .asciiz "Digite o exponencial: "
	resultado: .asciiz "Resultado: "
.text
.globl main

main:	
	li $v0, 4
	la $a0, entrada_x # printa a label entrada_x
	syscall
	
	li $v0, 5 # scanf entrada x
	syscall
	
	la $a2, ($v0) 
	
	li $v0, 4
	la $a0, entrada_exp # printa a label entrada_exp
	syscall
	
	li $v0, 5 # scanf entrada exp
	syscall
	
	la $a1, ($v0)
	
	jal power_base2 # chama a funcao
	
	move $t1, $v0 # t1 recebe o returno da funcao power
	
	li $v0, 4
	la $a0, resultado # printa a label resultado
	syscall
	
	li $v0, 1
	move $a0, $t1 # printa o resultado
	syscall
	
	li $v0, 10 # encerra o programa
	syscall
	
.globl power_base2

power_base2:
	
	beq $a1, 0, exp_0 # if exp == 0 j exp_0
	beq $a1, 1, exp_1 # if exp == 1 j exp_1
	
	li $v0, 2 
	 
	subi $a1, $a1, 1   # exp -= 1
	sllv $v0, $v0, $a1 # v0 = 2 << exp
	mul $v0, $v0, $a2  # v0 *= x
	jr $ra
	
	exp_0:
	move $v0, $a2 # return x
	jr $ra
	
	exp_1:
	mul $v0, $a2, 2 # return x * 2
	jr $ra
	