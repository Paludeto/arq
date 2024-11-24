.data 
	save: .word 4, 4, 4, 4, 4, 3, 2, 1
.text
	main:
	li $s3, 0 # Contador
	li $s5, 4 # Número a ser encontrado no word
	la $s6, save # Carrega o endereço do primeiro valor do vetor da label save
	
	WHILE:
	add $t1, $s6, $t0 # Usa t1 para conservar o endereço de s6
	
	lw $s1, 0($t1) # Carrega endereço de t1 com offset 0 
	bne $s1, $s5, sair # Caso não encontrou valor, saia do loop
	
	addi $s3, $s3, 1 # Incrementa contador caso encontrou
	addi $t0, $t0, 4 # Incrementa offset a partir de $s6
	
	j WHILE # Volta para o loop até que o caso-base seja cumprido

	sair:
	li $v0, 1
	move $a0, $s3
	syscall

	li $v0, 10
	syscall
