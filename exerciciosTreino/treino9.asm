.data
str: .asciiz "Introduza uma string\n"
str2: .asciiz "O número de caracteres numéricos é: "
str1: .space 40

.text
.globl main
main: la $a0, str
	li $v0,4
	syscall
	
	li $v0, 8
	la $a0, str1
	li $a1, 40
	syscall
	
	li $t0, 0 #n= 0
	
sor:	lb $t1, 0($a0)
	beq $t1, '\0', fim
	sle $t2, $t1, '9'
	sge $t3, $t1, '0'
	beq $t2, 1, pre
	addi $a0, $a0, 1
	j sor
	
pre: beq $t3, 1, contar
	addi $a0, $a0, 1
	j sor
contar: addi $t0, $t0,1
	addi $a0, $a0, 1
	j sor
fim: la $a0, str2
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0,1
	syscall
	li $v0, 10
	syscall

	