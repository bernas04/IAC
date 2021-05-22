	.data
str: .asciiz "Insira 6 números: \n"
array: .space 24
insert: .asciiz ">"
separador: .asciiz "__"
.text
.globl main

main: la $a1, array
	la $a2, array
	addi $t0, $t0, 0
	addi $t1, $0,0
	
	la $a0, str
	li $v0, 4
	syscall
	
while: beq $t0, 6, temp
	la $a0, insert
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	sw $v0, 0($a1)
	addi $t0, $t0, 1
	addi $a1, $a1, 4
	j while

temp: la $a0, str
	li $v0, 4
	syscall
	
	 la $a0, separador
	 li $v0,4
	 syscall
	 
	  j imprimir 
imprimir: beq $t1,6, fim
	lw $a0, 0($a2)
	
	li $v0, 1
	syscall
	
	la $a0, separador
	li $v0, 4
	syscall
	
	addi $t1, $t1,1
	addi $a2, $a2,4
	j imprimir
fim: li $v0, 10
	syscall
	
	