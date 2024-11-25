.data
	string1: .asciiz "Digite o primeiro valor\n"
	string2: .asciiz "Digite o segundo valor\n"
.text
	main:
	
	# Exibe string1, recebe primeiro valor
		la $a0, string1
		li $v0, 4
		syscall
		
		li $v0, 5
		syscall
		
		move $t0, $v0
	
	# Exibe string2, recebe segundo valor
		la $a0, string2
		li $v0, 4
		syscall
		
		li $v0, 5
		syscall
		
		move $t1, $v0
		
	# Carrega 1 no registrador $s0 para utilizá-lo em SLT e SGT
		li $s0, 1
		
	# Caso $t0 > $t1, pular para primeiro maior
		sgt $t3, $t0, $t1
		beq $t3, $s0, primeiroMaior
		
	# Caso $t0 < $t1, pular para segundoMaior
		slt $t3, $t0, $t1
		beq $t3, $s0, segundoMaior
		
	# Sem jumps, cai aqui e printa -111
	iguais:
	
		li $a0, -111
		li $v0, 1
		syscall
		
		j sair
	
	primeiroMaior:
		
		move $a0, $t0
		li $v0, 1
		syscall
		
		j sair
	
	segundoMaior:
	
		move $a0, $t1
		li $v0, 1
		syscall
		
	sair:
	
		li $v0, 10
		syscall
	
		
		
		
		
		
