.data
array: .word 34, 7, 23, 32, 15, 88, 26, 12, 29, 5   # vetor com 10 posições

printMenor: .asciiz "min = "
printMaior: .asciiz "max = "
pulaLinha: .asciiz "\n"

.text
.globl main
	main:
	
	li $t4, 0
	la $s0, array          # Carrega o endereço base do vetor em $a0
	li $t0, 0                  # Inicializa o índice i = 0
	lw $t1, 0($s0)       # Inicializa $t1 com o primeiro elemento do vetor (min = array[0])

	lw $t2, 0($s0)       # Inicializa $t2 com o primeiro elemento do vetor (max = array[0])
	li $t3, 36               # Tamanho do vetor

	# Seu código vem aqui
	while:
	
	bgt $t0, $t3, exit # if i > tamanho do vetor, pula pro final
	
	lw $t4, array($t0) # carrega o valor da array na posicao i no t4
	
	bgt $t4, $t2, moveMaior # se t4 for maior que o valor salvo no t2(max) vai pro moveMaior
	
	blt $t4, $t1, moveMenor # se t4 for menor que o valor salvo no t1(min) vai pro moveMaior
	
	addi $t0, $t0, 4 # i += 4
	j while
	
	moveMaior:
	
	move $t2, $t4 # salva valor de t4 no t2(max)
	j while
	
	moveMenor:
	
	move $t1, $t4 # salva valor de t4 no t1(min)
	j while
	
	exit:
	
	li $v0, 4
	la $a0, printMenor # printa label printMenor
	syscall
	
	li $v0, 1
	move $a0, $t1 # printa o t1(valor minimo)
	syscall
	
	li $v0, 4
	la $a0, pulaLinha # printa label printMenor
	syscall
	
	li $v0, 4
	la $a0, printMaior # printa label printMenor
	syscall
	 
	li $v0, 1
	move $a0, $t2 # printa o t2(valor maximo)
	syscall
	
    	li $v0, 10 # Encerra o programa
   	syscall