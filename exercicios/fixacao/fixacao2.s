.data

	vetor: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, -100
	string1: .asciiz "Seja bem vindo! \nPor favor entre com um valor inteiro para pesquisar no vetor\n\n"
	stringEncontrado1: .asciiz "Elemento "
	stringEncontrado2: .asciiz " encontrado\n\n"
	stringFalha: .asciiz "Elemento não encontrado\n\n"

.text
	main:
		la $a0, string1
		li $v0, 4
		syscall 

	# Pede o número
		li $v0, 5
		syscall 
		move $s1, $v0
		
	# Índice, limite
		li $t0, 0 
		li $t1, 16

	# Carrega vetor em s0
		la $s0, vetor

	while:
	
	# Condições de saída do while. Índice ou elemento encontrado.
		beq $t0, $t1, naoEncontrado

		lw $s2, 0($s0)
		beq $s1, $s2, encontrado

		addi $t0, $t0, 1
		addi $s0, $s0, 4
		
		j while

	naoEncontrado:
		
		la $a0, stringFalha
		li $v0, 4
		syscall 
		
		j sair

	encontrado: 
		
		la $a0, stringEncontrado1
		li $v0, 4
		syscall

		move $a0, $s1
		li $v0, 1
		syscall
		
		la $a0, stringEncontrado2
		li $v0, 4
		syscall
		
		j sair
	
	sair: 

		li $v0, 10
		syscall		