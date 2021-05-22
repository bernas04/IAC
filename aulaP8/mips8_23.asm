	.data

maiusculas:	.asciiz "STRING"
minusculas:	.space 11
	
	.text
	.globl main
	
main: 
	la $a1,maiusculas
	la $a2, minusculas 
	
	li $s1,0
	li $s2,11
	
while:	beq $s1, $s2, end
	
	add $t0,$a1,$s1 	#t0 index das MAIUSCULAS
	add $t1, $a2, $s1	#t1= minusculas[i]
	
	lb $t2,0($t0)		#t2= maisuclas[i]
	addi $t2,$t2,32
	
	sb $t2, 0($t1)
	
	addi $s1, $s1, 1
	
	j while

end:	sb $zero, 0($t1)

	move $a0, $a2
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall