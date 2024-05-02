.data

Operador1: .asciiz "Digite o Operador 1: "
Operador2: .asciiz "Digite o Operador 2: "
Operacao: .asciiz "Digite a operação que deseja realizar: \n1- Adição \n2- Subtração \n3- Divisão \n4- Multiplicação\n"
Resultado: .asciiz "Resultado: "
Resto: .asciiz "\nResto da divisão:"
Erro: .asciiz "Não é possivel dividir por 0!"
OpInvalida: .asciiz "Operacao digitada é invalida!"

.text
.globl main

	main:
	
	li $a1, 0 # Operador 1
	li $a2, 0 # Operador 2
	li $s2, 0 # Operacao
	li $s0, 0 # Resultado
	li $s1, 0 # Resto da divisao
	
	li $v0, 4
	la $a0, Operador1 # printa label Operador1
	syscall
	
	li $v0, 5 
	syscall
	move $a1, $v0 # salva o input 1 do usuario 
	
	li $v0, 4
	la $a0, Operador2 # printa label Operador2
	syscall
	
	li $v0, 5 
	syscall
	move $a2, $v0 # salva o input 2 do usuario 
	
	li $v0, 4
	la $a0, Operacao # printa label Operacao
	syscall
	
	li $v0, 5 
	syscall
	move $s2, $v0 # salva o input 3 do usuario
	
	comparacao1:
	bne  $s2, 1, comparacao2 # se nao for 1 pula pra proxima comparacao
	jal adicao
	move $s0, $v0 # salva o retorno da funcao em s0
	j printa 
	
	comparacao2:
	bne $s2, 2, comparacao3 # se nao for 2 pula pra proxima comparacao
	jal subtracao 
	move $s0, $v0 # salva o retorno da funcao em s0
	j printa
	
	comparacao3:
	bne $s2, 3, comparacao4 # se nao for 3 pula pra proxima comparacao
	jal divisao
	mflo $s0 # salva o resultado em s0
	mfhi $s1 # salva o resto da divisao em s1
	j printa
	
	comparacao4:
	bne $s2, 4, opInvalida  # se nao for 4 nao é nenhuma entao operacao invalida
	jal multiplicacao
	move $s0, $v0 # salva
	j printa
	
	adicao:
	add $v0, $a1, $a2 # soma a1 e a2 no retorno da funcao v0
	jr $ra 
	
	subtracao:
	sub $v0, $a1, $a2 # subtrai a2 de a1 no retorno da funcao v0
	jr $ra
	
	divisao:
	beq $a2, 0, erro
	div $a1, $a2 # divide a1 por a2
	jr $ra
	
	multiplicacao:
	mul $v0, $a1, $a2 # multiplica a1 e a2 no retorno da funcao v0
	jr $ra
	
	opInvalida:
	li $v0, 4
	la $a0, OpInvalida # printa label OpInvalida
	syscall
	j exit
	
	erro:
	li $v0, 4
	la $a0, Erro # printa label Erro
	syscall
	j exit
	
	printaResto:
	
	li $v0, 4
	la $a0, Resto # printa label Resto
	syscall
	
	li $v0, 1
	move $a0, $s1 # printa label Resultado
	syscall
	
	j exit
	
	printa:
	
	li $v0, 4
	la $a0, Resultado # printa label Resultado
	syscall
	
	li $v0, 1
	move $a0, $s0 # printa label Resultado
	syscall
	
	bne $s1, 0, printaResto # se tiver resto da divisao ele pula pro printaResto
	
	exit:
	
    	li $v0, 10 # Encerra o programa
   	syscall
