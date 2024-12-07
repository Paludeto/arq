# 6) Faça um programa, em assembly do mips, que receba um valor inteiro do teclado, se esse valor for igual a 10 imprima-o na tela e saia do programa. 
# Senão imprima 0 e saia do programa.

.data

.text
	main:
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $t1, 10
		bne $t0, $t1, false
		
		move $a0, $t0
		li $v0, 1
		syscall
		
		j sair
		
	false:
		li $a0, 0
		li $v0, 1
		syscall
		
		j sair
	
	sair:
		li $v0, 10
		syscall
		
