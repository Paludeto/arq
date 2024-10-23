.data
	v: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	string1: .asciiz "Vetor ["
	string2: .asciiz "] = "
	string3: .asciiz "\n"
.text
	main:
	la $s1, v

	soma:
	la $s0, 40
	lw $t0, 0($s1)
	addi $t0, $t0, 15
	move $t0, $s1
	
	beq $s1, $s0, sair

	addi $s1, $s1, 4 
	
	j soma

	sair:

	# implementar
	
	li $v0, 10
	syscall
