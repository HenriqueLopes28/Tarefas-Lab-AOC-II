.data
	c: .asciiz "C = "
	d: .asciiz "\nD = "
.text
.globl main

	main:

	li $a1, 2 # int arg1 = 2
	li $a2, 3 # int arg2 = 3
	li $s0, 0 # int c = 0
	li $s1, 0 # int d = 0
	
	jal soma # chama a func. soma
	
	move $s0, $v0 # a soma retorna no v0, agora salva em s0 (c)
	
	li $v0, 4 # print de string
	la $a0, c # printa a label c
	syscall
	
	li $v0, 1 # print de int
	move $a0, $s0 # printa a variavel s0 (c)
	syscall
	
	jal sub # chama a func. sub
	
	move $s1, $v0 # a subtracao retorna no v0, agora salva em s0 (c)
	
	li $v0, 4 # print de string
	la $a0, d # printa a label d
	syscall
	
	li $v0, 1 # print de int
	move $a0, $s1 # printa a variavel s1 (d)
	syscall
	
	li $v0, 10 # encerra o programa
	syscall
	
	
	soma:
	
	add $v0, $a1, $a2 # adiciona arg1 e arg2 e salva em v0
	jr $ra # retorna de onde foi chamado
	
	sub:
	
	sub $v0, $a1, $a2 # subtrai arg1 e arg2 e salva em v0
	jr $ra # retorna onde foi chamado
	
	