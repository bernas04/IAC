	.data
strpar: .asciiz "N�mero par"
strimpar: .asciiz "N�mero �mpar"
inicial: .asciiz "Insira um n�mero: "

	.text
	.globl main

main: la $a0, inicial #print
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	andi $t1, $t0, 1
	beq $t1, $0, par
	la $a0, strimpar
	j print
	
par: la $a0, strpar
	j print
	
print: 
	li $v0, 4
	syscall
	li $v0, 10
	syscall
	
	
	
