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
		
