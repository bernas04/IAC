	.data
str: .asciiz "isto e minusculo"
space: .space 20
	.text
	.globl main
	
main: la $a2, space
	la $a1, str
	
	li $s1, 0
	li $s2, 20

for: 	
	beq $s1, $s2, fim
	add $t0, $a1, $s1
	lb $t1, 0($t0)
	addi $t1, $t1, -32
	
	add $t2, $a2, $s1
	sb $t1, 0($t2)
	addi $s1, $s1, 1
	j for
fim: 
	la $a0, space
	li $v0, 4
	syscall
	li $v0, 10
	syscall