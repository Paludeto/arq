.data
	v: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
	string: .asciiz "Resultado: "
.text
	main:
	la $s3, v
	lw $t1, 8($s3)
	lw $t2, 16($s3)
	add $t3, $t1, $t2

	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall

	li $v0, 10
	syscall
