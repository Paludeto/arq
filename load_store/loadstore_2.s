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
		li $s1, 9
		
		bne $s0, $s1, forLoop
	
		j sair
	
	forLoop:
	
	# Soma de elementos
		lw $s2, 0($t0)
		addi $s2, $s2, 15
		
	# Incrementa $t0 em 4 unidades (offset) e $s0 em 1 unidade
		addi $t0, $t0, 4
		addi $s0, $s0, 1
		
	# Syscalls strings
		la $a0, string1
		li $v0, 4
		syscall
		
	# Move $s2 para $a0 e dá uma syscall para exibir o novo valor
		move $a0, $s2
		li $v0, 1
		syscall
		
		la $a0, string2
		li $v0, 4
		syscall
		
		la $a0, string3
		li $v0, 4
		syscall
		
	# Volta para main
		
		j main
	
	sair: 
		li $v0, 10
		syscall
		
		


