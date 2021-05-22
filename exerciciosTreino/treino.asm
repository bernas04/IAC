	.data 
str: .asciiz "Introduza uma string\n"
str1: .asciiz "O número de caracteres numéricos é: "
str2: .space 40

	.text
	.globl main
main: la $a0, str
	li $v0, 4
	syscall
	
	li $v0,8
	la $a0, str2
	li $a1, 40
	move $t0, $a0
	syscall
	
	addi $t1, $0, 0	#n = 0
	
for: 
	lb $t2, 0($a0)
	beq $t2, '\0', end
	blt $t2, '0', case
	bgt $t2, '9', case
	addi $t1, $t1,1
	addi $a0, $a0,1
	j for
	
case: addi $a0, $a0, 1
	j for
	
end: la $a0, str1
	li $v0, 4
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall