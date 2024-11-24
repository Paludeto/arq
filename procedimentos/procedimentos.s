.data

.text
	soma:
		addi $sp, $sp, -4
		sw $s0, 4($sp)
		add $s0, $a0, $a1
		move $v0, $s0

		lw $s0, 4($sp)
		addi $sp, $sp, 4	

		jr $ra
	
	main:
		li $v0, 5
		syscall

		move $a0, $v0

		li $v0, 5
		syscall
		
		move $a1, $v0

		jal soma
			
		move $a0, $v0
		li $v0, 1
		syscall

		li $v0, 10
		syscall

