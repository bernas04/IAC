	.data
str: .asciiz "String\n"
	
	.text

	.globl main
	
main: li $t0, 4

while: beqz $t0, dodne
	la $a0, str
	li $v0, 4
	syscall
	addi $t0, $t0, -1
	j while
	
dodne: li $v0, 10
	syscall
	
	