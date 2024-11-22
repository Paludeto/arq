.data
	# Define um vetor de words (4 bytes cada)
	v: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
	string: .asciiz "Resultado: "
.text
	main:
	
	# Utiliza o comando load address para carregar o vetor v em um registrador temporário
		la $s3, v
	
	# Utiliza o comando lw (load word) para carregar o valor do terceiro e quinto elementos
		lw $t1, 8($s3)
		lw $t2, 16($s3)
	
	# Soma ambos elementos e coloca em $t3
		add $t3, $t1, $t2

	# Syscall para exibir string (4)
		li $v0, 4
		la $a0, string
		syscall
	
	# Syscall para exibir imediato/inteiro (1)
		li $v0, 1
		move $a0, $t3
		syscall

	# Saída
		li $v0, 10
		syscall
