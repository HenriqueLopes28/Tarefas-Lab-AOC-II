.data
	num: .word 10
	resultado: .word 0
.text
	.globl main
	
	main:
		
	#chamada da funcao
	lw $a0, num
	jal fatorial
	sw $v0, resultado
		
	# print do resultado
	li $v0, 1
	lw $a0, resultado
	syscall
		
	# encerrando o programa
	li $v0, 10
	syscall


	.globl fatorial
	fatorial:
		
	subu $sp, $sp, 8
	sw $ra, ($sp)
	sw $s0, 4($sp)
	
	# testa se chegou em 0
	li $v0, 1 # retorna 1
	beq $a0, 0, fim_fatorial
	
	# chama o fatorial-1
	move $s0, $a0
	sub $a0, $a0, 1
	jal fatorial
	
	# multiplica nos retornos da funcao
	mul $v0, $s0, $v0
	
	fim_fatorial:
	
	# volta os valores anteriores da stack
	lw $ra, ($sp)
	lw $s0, 4($sp)	
	addu $sp, $sp, 8
	
	jr $ra
	