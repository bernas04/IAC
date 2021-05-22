	.data
str: .asciiz "stringminuscula"
mai: .space 20
	.text 
	.globl main
main: li $s1, 0
	li $s2, 20
	la $a2, mai
	la $a1, str
while: beq $s1, $s2, done
	add $t0, $a1, $s1
	lb $t1, 0($t0)
	addi $t1, $t1, -32
	
	add $t2, $a2, $s1
	sb $t1, 0($t2)
	
	addi $s1, $s1, 1
	j while
done: la $a0, mai
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
