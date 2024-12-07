# 9) Codifique um programa correspondente ao seguinte código em c:
#   
#   int a = 3;
#   int b = 4;
#   int m = 10;
#   m = a;
#   if ( b < m )
#        m = b;
#   
#   printf("%i", m);
            
# Agora, teste a e b com outros valores.
.data

.text
    main:

        li $t0, 3  # a
        li $t1, 4  # b
        li $t2, 10 # m
        
        li $t4, 1

        # Se b < m, t3 valerá 1
        slt $t3, $t1, $t2 

        # Se o valor armazenado em t3 for igual a t4 (1), pular pra true
        beq $t3, $t4, true

    sair:

        # Move valor de t2 para a0, argumento da syscall
        move $a0, $t2
        li $v0, 1
        syscall
        
        li $v0, 10
        syscall

    true:

        # t2 recebe t1
        move $t2, $t1

        j sair