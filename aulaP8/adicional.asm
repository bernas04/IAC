	.data
array:	.word 24 #=4*6
inserir:.asciiz "Insira 6 números: \n"
insert:	.asciiz "> "
desor:	.asciiz "Array Desordenado:"
ordenado:	.asciiz "\nArray Ordenado:"
space:	.asciiz " | "
	.text
	
	.globl main
	
main: la $a1, array
	addi $t0, $0,0
	
	la $a0, inserir
	li $v0, 4
	syscall
	
while: beq $t0, 6, resetDesordenado

	la $a0, inserir
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	sw $v0, 0($a1)
	
	addi $a1, $a1, 4
	addi $t0,$t0,1
	
	j while
resetDesordenado:
	subi $a1, $a1, 24
	li $t0, 0
	
	la $a0, desor
	li $v0,4
	syscall
	
	la $a0, space
	li $v0, 4
	syscall
	
	j lerDesordenado
	
lerDesordenado:
	beq $a1, $a2, label