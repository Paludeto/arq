.data
	msg1: .asciiz "1. Soma\n2. Subtração\n3. Multiplicação\n4. Divisão\n5. Sair\nEscolha uma opção\n"
	primeiro: .asciiz "Digite o primeiro número\n\n"
	segundo: .asciiz "Digite o segundo número\n\n"
	resultado: .asciiz "Resultado: "
	entrInv: .asciiz "Entrada inválida"
.text
	main:  
		la $a0, msg1  
		li $v0, 4     
		syscall
		
		li $v0, 5
		syscall
		
		move $t0, $v0
		
		li $t1, 1
		li $t2, 2
		li $t3, 3
		li $t4, 4
		li $t5, 5
		
		beq $t0, $t1, soma
		beq $t0, $t2, subtracao
		beq $t0, $t3, multiplicacao
		beq $t0, $t4, divisao
		beq $t0, $t5, sair
		
		li $v0, 4
		la $a0, entrInv
		syscall
		j sair	
		
	entrada:
		la $a0, primeiro
		li $v0, 4
		syscall
		
		li $v0, 5
		syscall
		
		move $t6, $v0
		
		la $a0, segundo
		li $v0, 4
		syscall
		
		li $v0, 5
		syscall
		
		move $t7, $v0
	soma: 
		j entrada
		
		add $t0, $t6, $t7
		
		j exibir
		
		j sair
	
	subtracao:
		
		j entrada
	
		sub $t0, $t6, $t7
		
		j exibir
		
		j sair
	multiplicacao:
	
		j entrada
		
		mul $t0, $t6, $t7
		
		j exibir
		
		j sair
	
	divisao:
	
		j entrada
		
		div $t0, $t6, $t7
		
		j exibir
		
	exibir:
		li $v0, 4
		la $a0, resultado
		syscall
		
		li $v0, 1
		move $a0, $t0
		syscall
	
	sair:
		li $v0, 10
		syscall
	
	

