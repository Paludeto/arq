# 11) Codifique em assembly do mips um programa correspondente a:
#
#     int i = 0;
#     int j = 10;
#     int k = 0;
#
#     while (i < j){
#
#         i++;
#         k +=10;
#
#     }
#
#     printf("%i", i);
#     printf("%i", k);

.data

.text  
    main:

    # Atribuição de valores iniciais
        move $t0, $zero     # t0 = i
        li $t1, 10          # t1 = j
        move $t2, $zero     # t2 = k

    loop:

    # Se i for maior ou igual a j, pular pra sair
        bgt $t0, $t1, sair
        beq $t0, $t1, sair
    
        addi $t0, $t0, 1    # i++
        add $t2, $t2, $t1   # k += 10 (que é o nosso j neste caso)

        j loop
    
    sair:
        li $v0, 10
        syscall