.data 
str: .asciiz "Te3m In5tei1ros Mis8tura9dos"
str1: .asciiz "\nO nr de Alfas e: "
.text 
.globl main

main: la $a0, str1
	li $v0, 4
	syscall

	la $a1, str
	jal conta
	
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10 
	syscall
	
conta: li $t0, 0
	li $t1, 0
nalphas: lb $t2, 0($a1)
	beqz $t2, retorno
	blt $t2, 'A', incremento
	bgt $t2, 'z', incremento
	addi $t0, $t0, 1
incremento: 
	addiu $a1, $a1, 1
	j nalphas
	
retorno: move $v0, $t0
	jr $ra 
	
