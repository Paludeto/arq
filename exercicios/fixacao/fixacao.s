.data

.text
	folha:

	# Reserva espaço na pilha para 3 registradores (12 bytes, 1 word)
		addi $sp, $sp, -12
	
	# Armazena o valor original de $s0 na pilha, convenção de chamadas de procedimento
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)

	# f = (g + h) - (i + j)
		add $s1, $a0, $a1
		add $s2, $a2, $a3
		sub $s0, $s1, $s2
		
		move $v0, $s0

	# Restaura o valor original de $s0 da pilha
	# Incrementa 12 ao stack pointer para restaurar a pilha
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)

		addi $sp, $sp, 12

		jr $ra
		
	main:

	# Recebe os parâmetros da função
		li $v0, 5
		syscall 
		move $a0, $v0

		li $v0, 5
		syscall 
		move $a1, $v0

		li $v0, 5
		syscall 
		move $a2, $v0

		li $v0, 5
		syscall 
		move $a3, $v0

		jal folha

	# Move o resultado da função para a0 para exibi-la
		move $a0, $v0

		li $v0, 1
		syscall
		
		j sair

	sair:
		li $v0, 10
		syscall	