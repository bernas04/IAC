	.data
str: .asciiz "Introduza uma string: "
str1: .space 20
str2: .asciiz "O número de caracteres da string é: "
	
	.text 
	.globl main
	
main: la $a0, str
	li $v0, 4
	syscall
	
	li $v0, 8
	la $a0, str1
	li $a1, 20
	syscall
	
	jal strlen
	
	move $t1, $v0
	
	la $a0, str2
	li $v0, 4
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
strlen: li $t0, -1 #nºcaracteres
	lb $s0, 0($a0)

while:  beq $s0, '\0', fim
	addi $t0,$t0,1
	addi $a0, $a0,1
	
	lb $s0, 0 ($a0)
	j while
	
fim: move $v0, $t0
	jr $ra
	
	