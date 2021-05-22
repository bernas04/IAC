.data
str: .word 4, 3 , -2, 1, 27, 45
string: .asciiz "O conteúdo do array é: "
traco: .asciiz " - "
.text
.globl main

main:
	la $a1, str
	li $t0, 0
	lw  $t1, 0($a1)
	
	la $a0, string
	li $v0, 4
	syscall
	
loop: beq $t0, 6, imprimir
	move $a0, $t1
	li $v0, 1
	syscall
	
	la $a0, traco
	li $v0, 4
	syscall
	
	addi $t0, $t0, 1
	addi $a1, $a1, 4
	lw $t1, 0($a1)
	j loop
imprimir: li $v0, 10
	syscall
	
	