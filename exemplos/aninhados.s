.data
    msgBase: .asciiz "Digite a base do triângulo:\n"
    msgAltura: .asciiz "Digite a altura do triângulo:\n"
    msgArea: .asciiz "A área do triângulo é: "
    newLine: .asciiz "\n"

.text
    .globl main
main:
    la $a0, msgBase
    li $v0, 4
    syscall 
    
    li $v0, 5
    syscall
    move $a0, $v0

    la $a0, msgAltura
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $a1, $v0

    jal calculaAreaTri
    
    move $t0, $v0

    la $a0, msgArea
    li $v0, 4
    syscall    

    move $a0, $t0
    li $v0, 1
    syscall

    la $a0, newLine
    li $v0, 4
    syscall

    li $v0, 10
    syscall
    
calculaAreaTri:
    addi $sp, $sp, -8
    sw $s0, 4($sp)
    sw $ra, 8($sp)
    
    mul $s0, $a0, $a1
    
    jal divPorDois

    lw $s0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 8
    jr $ra

divPorDois:
    div $v0, $s0, 2
    jr $ra

