
	.data
str: .asciiz "O valor do 6ºelemento da série de Fibonacci é "
	
	.text
	.globl main
	
main:	la $a0, 6   #n = 6 
	
	jal fibo  # fibo()
	move $a1, $v0 # Guarda o valor devolvido
	
	li $v0, 4
	la $a0, str
	syscall
	
	# Print result
	li $v0, 1
	move $a0, $a1
	syscall

	# Exit
	li $v0, 10
	syscall
	
fibo:	addi $sp,$sp, -12 
	sw $ra, 8($sp)      	
	sw $s0, 4($sp)	   	
	sw $s1, 0($sp)		
	move $s0, $a0  	   	#n em $s0
	li $v0, 1	   	
	ble $s0, 0x2, doneF
	addi $a0, $s0, -1  	
	jal fibo 		
	move $s1,$v0	#aux = $s1   	
	addi $a0, $s0, -2 	
	jal fibo 		
	
	add $v0,$s1,$v0   	
			
doneF:
	lw $ra, 8($sp)
	lw $s0, 4($sp) 	
	lw $s1, 0($sp)
	addi $sp, $sp, 12
	jr $ra
	 
