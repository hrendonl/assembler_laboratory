.data
prompt:     .asciiz "Ingrese la cantidad de términos de la serie Fibonacci: "
result:     .asciiz "Serie Fibonacci: "

.text
.globl main

main:
    # Solicitar al usuario la cantidad de términos de la serie
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  # Almacenar n en $t0

    # Inicializar los primeros dos términos de la serie Fibonacci
    li $t1, 0  # Primer término (F(0))
    li $t2, 1  # Segundo término (F(1))

    # Imprimir mensaje de inicio de la serie Fibonacci
    li $v0, 4
    la $a0, result
    syscall

    # Imprimir los primeros n términos de la serie Fibonacci
    move $a0, $t1
    li $v0, 1
    syscall

    # Calcular y mostrar los términos restantes
    move $a0, $t2

    # Calcular y mostrar los términos restantes de la serie Fibonacci
    loop:
        add $t3, $t1, $t2  # Sumar los dos términos anteriores
        move $a0, $t3      # Cargar el término actual para imprimirlo
        li $v0, 1
        syscall

        # Actualizar los términos anteriores
        move $t1, $t2
        move $t2, $t3

        # Decrementar n y comprobar si hemos mostrado suficientes términos
        subi $t0, $t0, 1
        bnez $t0, loop

    # Salir del programa
    li $v0, 10
    syscall
