.data
prompt1:    .asciiz "Ingrese el primer número: "
prompt2:    .asciiz "Ingrese el segundo número: "
prompt3:    .asciiz "Ingrese el tercer número: "
result:     .asciiz "El número menor es: "

.text
.globl main

main:
    # Solicitar al usuario que ingrese los tres números
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    # Inicialmente, asumimos que el primer número es el menor
    move $t3, $t0

    # Compara el segundo número con el menor actual
    blt $t1, $t3, update_min1
    move $t1, $t3

update_min1:
    # Compara el tercer número con el menor actual
    blt $t2, $t1, update_min2
    move $t2, $t1

update_min2:
    # Imprime el resultado
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Salir del programa
    li $v0, 10
    syscall
