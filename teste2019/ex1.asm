.data
conteudo: .word  -2, 3, 6, 4, 8, 126, -131, 17
str: .asciiz "Números: "
str1: .asciiz ", "

.text
.globl main

main: la $a2, conteudo
	addi $t0, $0,0 #i = 0
	li $t7, 2
	
for: beq $t0, 8, fim
	sll $t2, $t0, 2
	add $t1, $a2, $t2 #lista[i]
	lw $t3, 0($t1)
	rem $t5, $t3, $t7
	bnez $t5, incremento
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	la $a0, str1
	li $v0, 4
	syscall
	


incremento: add $t0, $t0, 1
	j for

fim: li $v0, 10
     syscall
