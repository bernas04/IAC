	.data

array:	.space 24
num:	.asciiz "Digite um número: "
teste:	.asciiz " < "
	.text
	.globl main
	
main:
	la $s0, array
	li $t0,0
	li $t9,1

# Preencher o Array

fill: 	beq $t0,6,ordenar
	
	la $a0, num
	li $v0,4
	syscall
	
	li $v0, 5
	syscall
	
	sll $t1, $t0,2
	add $t2, $s0, $t1
	
	sw $v0, 0($t2)
	addi $t0,$t0,1
	j fill

# Array completo
		
ordenar: beqz $t9, fim
	li $t9,0
	li $t0,0

ord: 	beq $t0,5, ordenar
	
	sll $t1,$t0,2 
	add $t2, $s0,$t1 
	
	lw $s1, 0($t2) 
	lw $s2, 4($t2)
	
if:	sgt $t3, $s1, $s2
	beqz $t3,endif	
	sw $s1, 4($t2)
	sw $s2, 0($t2)
	
endif:	addi $t0, $t0,1
	add $t9,$t9,$t3
	j ord


fim:	beq $t9,6,out
	
	sll $t0, $t9,2
	add $t1, $t0, $s0
	lw $a0, 0($t1)
	
	li $v0,1
	syscall
	
	bge $t9,5, seguinte		
	la $a0, teste
	li $v0,4
	syscall
	
seguinte:	addi $t9, $t9,1
	j fim

out: li $v0, 10
	syscall
	