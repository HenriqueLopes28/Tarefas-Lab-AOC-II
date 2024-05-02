.data
	espaco: .asciiz " "
	input: .asciiz "\nPor favor, digite um numero inteiro: "
	
.text
	main:
	
		li $s0, 0 # int n - declara o n que recebera do usuario
		li $s1, 0 # int i - declara o i
		
		li $v0, 4 # 4 - string
		la $a0, input # printa o input
		syscall
		
		li $v0, 5 # 5 - scanf
		syscall
		
		move $s0, $v0 # move a variavel pega pelo scanf para $v0
		
		while:
		
			beq $s1, $s0, exit # se o valor do i e o input do do usuario forem iguais pula para exit
			
			addi $s1, $s1, 1 # adiciona 1 no i
			
			j printi # pula para o printi
			
		exit:
		
			li $v0, 10 # finaliza o programa
			syscall
		
		printi:
			
			li $v0, 1 # 1 - int
			move $a0, $s1 # printa o i
			syscall
			
			li $v0, 4 
			la $a0, espaco # printa o espaco entre os numeros
			syscall
			
			j while # volta para o comeco do while
