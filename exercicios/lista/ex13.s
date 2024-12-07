# 13) Implementar o código correspondente em MIPS
#
#     int vetor[] = {3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, -100}
#     printf("Seja bem vindo! \nPor favor entre com um valor inteiro para pesquisar no vetor\n\n");
#
#     scanf("%i", elemento);
#
#     while(vetor[i] != -100){
#
#         if(vetor[i] == elemento){
#             printf("Elemento %i encontrado\n\n", elemento );
#             exit(0);
#         }
#
#         i++;
#     }
#
#     printf("Elemento não encontrado\n\n");
#     exit(0);
.data

    vetor: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, -100
    str1: .asciiz "Seja bem vindo! \nPor favor entre com um valor inteiro para pesquisar no vetor\n\n"
    str2: .asciiz "Elemento " 
    str3:  .asciiz " encontrado\n\n"
    str4: .asciiz "Elemento não encontrado\n\n"

.text
    main:

    # Valores inicializados
        la $t1, vetor       # vetor
        move $t3, $zero     # indice
        li $t4, 16          # num max elementos

        la $a0, str1 
        li $v0, 4
        syscall

        li $v0, 5
        syscall

        move $t2, $v0

    while:

        lw $t5, 0($t1)
        beq $t2, $t5, encontrou
        beq $t3, $t4, naoEncontrou
    
    # Incrementa offset e indice
        addi $t1, $t1, 4
        addi $t3, $t3, 1

        j while

    encontrou:

    # Imprime elemento encontrado no array
        la $a0, str2
        li $v0, 4
        syscall

        move $a0, $t2
        li $v0, 1
        syscall

        la $a0, str3
        li $v0, 4
        syscall

        j sair

    naoEncontrou:

        la $a0, str4
        li $v0, 4
        syscall

    sair:
    
        li $v0, 10
        syscall
