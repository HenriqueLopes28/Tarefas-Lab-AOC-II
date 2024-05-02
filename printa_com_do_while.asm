.data
	num: .asciiz "Quantos numeros?\n"
	info_num: .asciiz "Informe o num.:\n"
.text
.globl main

	main:

	li $a1, 0 # int val = 0
	li $s0, 0 # int i = 0
	li $s1, 0 # int n = 0
	
	li $v0, 4 # print de string
	la $a0, num # printa a label num
	syscall
	
	li $v0, 5 # scanf
	syscall
	
	move $s1, $v0 # coloca o valor lido na variavel n
	
	while:
	
	li $v0, 4 # print de string
	la $a0, info_num # printa a label info_num
	syscall
	
	li $v0, 5 # scanf
	syscall
	
	la $a1, ($v0) # coloca o valor lido na variavel val
	
	jal printa # chama a funcao printa
	
	addi $s0, $s0, 1
	
	blt $s0, $s1, while # pula para while se for i < n
	
	
	li $v0, 10 # encerra o programa
	syscall
	
	
	printa:
	
	li $v0, 1 # prepara o v0 para int
	move $a0, $a1 # printa o val
	syscall
	jr $ra # retorna de onde foi chamado
	