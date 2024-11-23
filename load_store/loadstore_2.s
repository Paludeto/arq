.data	
	# Define um vetor de words (inteiros de 4 bytes)
	v: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	string1: .asciiz "Vetor ["
	string2: .asciiz "] = "
	string3: .asciiz "\n"
.text
	main:	
	
	# Carrega o endereço do vetor v em $t0
		la $t0, v
		
	# $s0 armazenará o nosso índice, $s9 o limite
		li $s0, 0
		li $s1, 10
	
	forLoop:
	
	# Verifica condição de saída do loop
		beq $s0, $s1, sair

	# Soma de elementos
		lw $s2, 0($t0)
		addi $s2, $s2, 15
		sw $s2, 0($t0)
		
	# Exibição de "Vetor [" 
		la $a0, string1
		li $v0, 4
		syscall
		
	# Mostra índice ($s0)
		move $a0, $s0
		li $v0, 1
		syscall
	
	# Exibe strings "] = "
		la $a0, string2
		li $v0, 4
		syscall
		

	# Mostra valor atualizado
		move $a0, $s2
		li $v0, 1
		syscall
	
	# Mostra string "\n
		la $a0, string3
		li $v0, 4
		syscall

	# Incrementa $t0 em 4 unidades (offset) e $s0 em 1 unidade (índice)
		addi $t0, $t0, 4
		addi $s0, $s0, 1
		
	# Volta para o ínicio do loop
		j forLoop
	
	sair: 
		li $v0, 10
		syscall
		
		


