.data
	msg: .asciiz "O fatorial é "
.text
	main:
		li $a0, 5
		li $t0, 1
		
		jal fact
		
		move $t0, $v0
		la $a0, msg
		li $v0, 4
		syscall
		
		move $a0, $t0
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		
	fact: 
		# Abre 8 bytes na pilha (top-to-bottom) para armazenar a0 e ra
		addi $sp, $sp, -8 
		
		# Preserva valor de $a0 e $ra
		sw $a0, 8($sp)
		sw $ra, 4($sp)
		
		# Testa se a0 é maior do que 1 para pular para L1
		bgt, $a0, $t0, L1
		li $v0, 1
		
		# Não é necessário recuperar o valor de a0 e ra, mas recuperamos por convenção e desalocamos espaço na pilha (somamos 8 no stack pointer)
		lw $a0, 8($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		
		jr $ra
	L1:
		# Decrementa a0 em 1 
		addi $a0, $a0, -1
		jal fact
		
		# Desempilha
		lw $a0, 8($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		
		mul $v0, $v0, $a0
		
		jr $ra
	
	
	# Para visualizar melhor, desenhar a stack no quadro a cada chamada de procedimento e ver o que acontece
