# 8) Faça um programa, em assembly do MIPS, que receba e multiplique dois inteiros sem usar a instrução de multiplicação do MIPS. Imprima o resultado na tela.
# obs: este programa nao lida com numeros negativos

.data
    str1: .asciiz "Digite o primeiro numero\n"
    str2: .asciiz "Digite o segundo numero\n"
    str3: .asciiz "Resultado\n"
.text
    main:

    # Pede primeiro numero e joga em $t1
        la $a0, str1
        li $v0, 4
        syscall

        li $v0, 5
        syscall

        move $t1, $v0

    # Pede segundo numero e joga em $t2
        la $a0, str2
        li $v0, 4
        syscall

        li $v0, 5
        syscall

        move $t2, $v0

    # Carrega $t0 com o valor 0, $t0 vai ser o acumulador
        li $t0, 0

    meuMul: 

        beq $t2, $zero, sair

        add $t0, $t0, $t1

        addi $t2, $t2, -1

        j meuMul

    sair: 

    # String resultado
        la $a0, str3
        li $v0, 4 
        syscall

    # Resultado multiplicacao
        move $a0, $t0
        li $v0, 1
        syscall

        li $v0, 10
        syscall