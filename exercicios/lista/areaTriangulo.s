# #include <stdio.h>
#
# float DivPorDois(int res) {  
#     return (res / 2);
# }
#
# float calculaAreaTriangulo(int base, int altura) {
#      int parcial = base * altura;
#
#      int resultado =  DivPorDois(parcial);
#
#      return resultado;
# }
#
# int main() {
#     float base, altura;
#     
#     printf("Digite a base do triângulo: ");
#     scanf("%d", &base);
#     
#     printf("Digite a altura do triângulo: ");
#     scanf("%d", &altura);
#     
#     float area = calculaAreaTriangulo(base, altura);
#     
#     printf("A área do triângulo é: %d\n", area);
#     
#     return 0;
# }

# Isso só vai funcionar para áreas inteiras...
.data
    str1: .asciiz "Digite a base do triângulo: \n"
    str2: .asciiz "Digite a altura do triângulo: \n"
    str3: .asciiz "A área do triângulo é: "
.text
    main:

    # Mostra a primeira string, pega o primeiro valor e joga em a0
        la $a0, str1
        li $v0, 4
        syscall

        li $v0, 5
        syscall

        move $t0, $v0   # armazenda o valor de t0 em t0 porque ainda usamos $a0

    # Mostra a segunda string, pega o valor e joga em a1
        la $a0, str2
        li $v0, 4
        syscall

        li $v0, 5
        syscall

    # Damos os valores aos argumentos
        move $a0, $t0
        move $a1, $v0

    # Chama a funcao calculaAreaTriangulo, com a0 e a1 valendo os valores digitados
        jal calculaAreaTriangulo

    # Pega o valor de v0, alterado na divisao, e coloca em t0
        move $t0, $v0

    # Exibe string, joga o resultado de t0 para a0 e exibe
        la $a0, str3
        li $v0, 4
        syscall

        move $a0, $t0
        li $v0, 1
        syscall

        li $v0, 10
        syscall

    calculaAreaTriangulo:

    # Aloca espaco na stack, armazena o valor anterior de ra
        addi $sp, $sp, -8
        sw $s0, 0($sp)
        sw $ra, 4($sp)

    # Multiplica a0 por a1, coloca em s0
        mul $s0, $a0, $a1

    # Coloca s0 em a0
        move $a0, $s0

    # Chama a funcao divPorDois
        jal divPorDois

    # Restaura valores e stack, volta para a main
        lw $s0, 0($sp)
        lw $ra, 4($sp)
        addi $sp, $sp, 8

        jr $ra
    
    divPorDois: 
        div $v0, $a0, 2

        jr $ra

