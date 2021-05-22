.data
str: .asciiz "O conteúdo do Array é: "
str2: .asciiz " - "
word: .word 4,3,-2,1, 27,45
.text
.globl main

main: la $a2, word
	lb $t0, 0($a2)
	
	la $a0, str
	li $v0, 4
	syscall
	
	li $t1, 0
for: beq $t1, 6, fim
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, str2
	li $v0, 4
	syscall

	addi $a2, $a2, 4
	addi $t1, $t1, 1
	lb $t0, 0 ($a2)
	j for
fim: li $v0, 10
	syscall
