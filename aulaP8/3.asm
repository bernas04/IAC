	.data
word: .word 4,3,-2,1, 27,45
str: .asciiz "O conteudo do array é: "
traço: .asciiz " __ "
	.text 
	.globl main
main:
	la $a2, word
	addi $t1, $0, 0
	lb $t0, 0($a2)
	
	la $a0, str
	li $v0, 4
	syscall
	
while: beq $t1, 6, fim

	move $a0, $t0
	li $v0,1
	syscall
	
	la $a0, traço
	li $v0, 4
	syscall
	
	addi $a2, $a2, 4
	lb $t0, 0($a2)
	addi $t1, $t1,1
	j while
	
fim: li $v0,10
	syscall
