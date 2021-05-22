.data 
str: .space 24 #6*4
str1: .asciiz "Inserir 6 números: \n"
desor: .asciiz "Array desordenado "
ordenado: .asciiz "\nArray Ordenado: "
separador: " | "
.text 
.globl main

main: 
	la $a1, str
	addi $t0, $0,0 #contador
	
	la $a0, str1
	li $v0, 4
	syscall
	
while: beq $t0, 6 ,resetDesordenado
	
	li $v0, 5
	syscall
	
	sw $v0,0($a1)
	
	addi $a1, $a1, 4
	addi $t0, $t0,1
	
	j while

resetDesordenado: subi $a1, $a1, 24
	li $t0,0
	
	la $a0, desor
	li $v0, 4
	syscall
	
	j lerDesordenado
	
lerDesordenado:
	beq $t0, 6, resetOrdenado
	
	lw $a0, 0($a1)
	li $v0, 1
	syscall
	la $a0, separador
	li $v0, 4
	syscall
	
	addi $a1, $a1, 4
	addi $t0, $t0,1
	
	j lerDesordenado
	
resetOrdenado: 
	subi $a1, $a1, 24
	li $t0, 0
	li $t3, 0
	j ordenar
	
ordenar: 
	beq $t0, 6, reset
	
	lw $s0, 0($a1)
	addi $a1, $a1, 4
	lw $s1, 0($a1)
	subi $a1, $a1, 4
	
	sle $s2, $s0, $s1
	add $t3, $t3, $s2
	
	beq $s2, 1, ord
	
	sw $s1, 0($a1)
	addi $a1, $a1, 4
	sw $s0, 0($a1)
	subi $a1, $a1,4
	
	addi $a1, $a1, 4
	addi $t0, $t0, 1
	j ordenar
	
ord: addi $a1, $a1, 4
	addi $t0, $t0, 1
	j ordenar
	
reset: bne $t3, 6, resetOrdenado
	subi $a1, $a1, 24
	li $t0, 0
	
	la $a0, ordenado
	li $v0, 4
	syscall
	
	j lerOrdenado
	
lerOrdenado: beq $t0, 6, done
	
	lw $a0 ,0($a1)
	
	li $v0,1
	syscall 
	
	la $a0, separador
	li $v0,4
	syscall
	
	addi $a1, $a1, 4
	addi $t0, $t0,1
	
	j lerOrdenado


done: li $v0, 10
	syscall
	