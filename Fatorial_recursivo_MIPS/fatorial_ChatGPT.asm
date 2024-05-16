.data
    output_format: .asciiz "%d\n"  # Formato de saída para printf

.text
.globl main

# Função fatorial
fatorial:
    # Prologue
    addi $sp, $sp, -8     # Reserva espaço na pilha
    sw $ra, 4($sp)        # Salva o endereço de retorno
    sw $a0, 0($sp)        # Salva o valor de n

    # Corpo da função
    lw $t0, 0($a0)        # Carrega n
    li $t1, 1             # Carrega 1
    ble $t0, $t1, base    # Verifica se n <= 1
    addi $a0, $a0, -1     # n - 1
    jal fatorial          # Chama fatorial(n - 1)
    lw $t2, 0($a0)        # Carrega n de volta
    mul $v0, $t2, $v0     # Multiplica n pelo resultado recursivo
    j end

base:
    li $v0, 1             # Retorna 1 para n <= 1

end:
    # Epilogue
    lw $a0, 0($sp)        # Restaura o valor de n
    lw $ra, 4($sp)        # Restaura o endereço de retorno
    addi $sp, $sp, 8      # Libera espaço na pilha
    jr $ra                # Retorna

# Função main
main:
    li $a0, 10            # Carrega o valor de n (10)
    jal fatorial         # Chama fatorial(10)

    # Chamada de função para printf
    move $a0, $v0          # Move o resultado para o argumento de impressão
    li $v0, 1              # Código de chamada do syscall para imprimir inteiro
    syscall

    li $v0, 10            # Carrega o código de saída de programa
    syscall               # Chama o sistema para encerrar o programa