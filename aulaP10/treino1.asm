.data
str: .asciiz "Introduza um número: "
str2: .asciiz "O fatorial do número "
str3: .asciiz " é "
.text 
.globl main

main: la $a0, str
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0
	move $s0, $v0
	jal fatorial
	
	la $a0, str2
	li $v0,4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, str3
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	

	
	
fatorial: 
	li $t0, 1 #soma = 1
	addi $t1, $a0, 0 #i= num

for : beqz $t1, exit
	
	mul $t0,$t0, $t1
	subi $t1, $t1,1
	j for




exit: move $v0, $t0
	jr $ra
	  
