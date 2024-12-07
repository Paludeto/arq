# 10) Codifique em assembly do mips um programa correspondente a :
#
#     int a = 2;
#     int b = 10;
#     x = 0;
#     if ( a >= 0 && b <= 50 )
#          x = 1;
#     printf("%i", x);
# Agora, teste a e b com outros valores.

.data

.text
    main:   
    
        li $t0, 2  # a
        li $t1, 10 # b
        move $t2, $zero # x

        # Valores de comparação
        li $t5, 50
        li $t6, 1

        # Negação das condições
        slt $t3, $t0, $zero
        bgt $t4, $t1, sair

        # Caso a seja menor que 0, pular para sair
        beq $t3, $t6, sair

        # Do contrário $t2, que é x, recebe $t6, que é 1
        move $t2, $t6

    sair:

        # Imprime $t2, que é x
        move $a0, $t2
        li $v0, 1
        syscall

        li $v0, 10
        syscall