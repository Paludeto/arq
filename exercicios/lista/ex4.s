# 4) Salve na memória o valor 100, na posição 20 usando como base o registrador $zero. Depois salve 200 na posição 40.

.data

.text
    main:
        li $t0, 100
        sw $t0, 20($zero)

        li $t1, 200
        sw $t1, 40($zero)

        li $v0, 10
        syscall 