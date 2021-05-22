	.data
	
min:	.asciiz "minus"
mai:	.space 10
	
	.text
	.globl main

main:	la $a2, mai # a0 fica com o array de MAIUSCULAS
	la $a1, min # a1 com array de min
	li $s1,0
	li $s2, 10
	
	
while:	beq $s1,$s2,done
	
	add $t0, $a1,$s1 # t0 fica com o endereço do array + o index da letra
	lb $t1, 0($t0)
	addi $t1,$t1,-32
	
	add $t2, $a2,$s1
	sb $t1, 0($t2)
	
	addi $s1,$s1,1
	j while


done: 	
	la $a0, mai
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	


